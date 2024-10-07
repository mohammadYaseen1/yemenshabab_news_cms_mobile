import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/core/helper/cache_helper.dart';
import 'package:yemenshabab/core/strings/messages.dart';
import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';
import 'package:yemenshabab/features/auth/domian/usecases/create_user.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final CreateUserUseCase createUserUseCase;

  SignUpBloc({required this.createUserUseCase}) : super(SignUpInitialState()) {
    on<TogglePasswordVisibilityEvent>((event, emit) {
      emit(state is PasswordHiddenState
          ? PasswordVisibleState()
          : PasswordHiddenState());
    });

    on<ToggleConfirmPasswordVisibilityEvent>((event, emit) {
      emit(state is ConfirmPasswordHiddenState
          ? ConfirmPasswordVisibleState()
          : ConfirmPasswordHiddenState());
    });

    on<SignUpSubmitEvent>((event, emit) async {
      await _onSignUpSubmit(event, emit);
    });
  }

  Future<void> _onSignUpSubmit(
    SignUpSubmitEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoadingState());

    final user = UserInfo(
      name: event.name,
      email: event.email,
      password: event.password,
      uuid: event.uuid,
    );

    final result = await createUserUseCase(userInfo: user);

    result.fold(
      (failure) {
        emit(SignUpErrorState(
            failure.message ?? AppMessages.somethingWentWrongMessage));
      },
      (_) {
        CacheHelper.setData(key: 'isLogin', value: true);
        CacheHelper.setData(key: 'userInfo', value: UserInfo.encode(user));
        // appRepository.userInfo = userInfo;
        isLoggedIn = true;
        userInfo = user;
        emit(SignUpSuccessState());
      },
    );
  }
}
