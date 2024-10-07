import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/core/helper/cache_helper.dart';
import 'package:yemenshabab/core/strings/messages.dart';
import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';
import 'package:yemenshabab/features/auth/domian/usecases/sign_in.dart';
import 'package:yemenshabab/features/auth/domian/usecases/sign_out.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;

  SignInBloc({
    required this.signInUseCase,
    required this.signOutUseCase,
  }) : super(SignInInitialState()) {
    on<TogglePasswordVisibilityEvent>((event, emit) {
      if (state is PasswordHiddenState) {
        emit(PasswordVisibleState());
      } else {
        emit(PasswordHiddenState());
      }
    });

    on<SignInSubmitEvent>((event, emit) async {
      await _onSignInSubmit(event, emit);
    });

    on<SignUpEvent>((event, emit) async {
      var result = await signOutUseCase.call();
      result.fold(
        (l) async {
          await CacheHelper.setData(key: 'isLogin', value: false);
          await CacheHelper.removeData(key: 'userInfo');
          isLoggedIn = false;
          userInfo = null;
          emit(SignOutState());
        },
        (r) async {
          await CacheHelper.setData(key: 'isLogin', value: false);
          await CacheHelper.removeData(key: 'userInfo');
          isLoggedIn = false;
          userInfo = null;
          emit(SignOutState());
        },
      );
    });
  }

  Future<void> _onSignInSubmit(
    SignInSubmitEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInLoadingState());

    final result = await signInUseCase.call(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) {
        emit(SignInErrorState(
            failure.message ?? AppMessages.somethingWentWrongMessage));
      },
      (user) {
        CacheHelper.setData(key: 'isLogin', value: true);
        CacheHelper.setData(key: 'userInfo', value: UserInfo.encode(user));
        isLoggedIn = true;
        userInfo = user;
        emit(SignInSuccessState(user));
      },
    );
  }
}
