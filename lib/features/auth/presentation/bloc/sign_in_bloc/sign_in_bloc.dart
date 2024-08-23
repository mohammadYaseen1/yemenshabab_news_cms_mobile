import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(PasswordHiddenState()) {
    on<TogglePasswordVisibilityEvent>((event, emit) {
      if (state is PasswordHiddenState) {
        emit(PasswordVisibleState());
      } else {
        emit(PasswordHiddenState());
      }
    });

    on<SignInSubmitEvent>((event, emit) async {
      // await _onSignInSubmit(event, emit);
    });

    on<SelectCountryCodeEvent>((event, emit) {
      emit(CountryCodeSelectedState(event.countryCode));
    });
  }

  // Future<void> _onSignInSubmit(
  //   SignInSubmitEvent event,
  //   Emitter<SignInState> emit,
  // ) async {
  //   emit(SignInLoadingState());
  //
  //   final result = await signInUseCase.call(
  //     phoneNumber: event.phoneNumber,
  //     password: event.password,
  //   );
  //
  //   result.fold(
  //     (failure) {
  //       emit(SignInErrorState(
  //           failure.message ?? AppMessages.somethingWentWrongMessage));
  //     },
  //     (user) {
  //       CacheHelper.setData(key: 'isLogin', value: true);
  //       CacheHelper.setData(key: 'userInfo', value: UserInfo.encode(user));
  //       appRepository.userInfo = user;
  //       emit(SignInSuccessState(user));
  //     },
  //   );
  // }
}
