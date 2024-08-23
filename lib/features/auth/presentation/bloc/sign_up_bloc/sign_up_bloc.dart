import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
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

    on<SelectGenderEvent>((event, emit) {
      emit(GenderSelectedState(event.gender));
    });

    on<SignUpSubmitEvent>((event, emit) async {
      // await _onSignUpSubmit(event, emit);
    });

    on<PhoneNumberAuthEvent>((event, emit) async {
      // await _onPhoneNumberAuth(event, emit);
    });

    on<VerifyOTPCodeEvent>((event, emit) async {
      // await _onVerifyOTPAuth(event, emit);
    });
  }

  // Future<void> _onSignUpSubmit(
  //   SignUpSubmitEvent event,
  //   Emitter<SignUpState> emit,
  // ) async {
  //   emit(SignUpLoadingState());
  //
  //   final userInfo = UserInfo(
  //     fullName: event.fullName,
  //     phoneNumber: event.phoneNumber,
  //     password: event.password,
  //     gender: event.gender,
  //     age: event.age,
  //   );
  //
  //   final result = await createUserUseCase(userInfo: userInfo);
  //
  //   result.fold(
  //     (failure) {
  //       emit(SignUpErrorState(
  //           failure.message ?? AppMessages.somethingWentWrongMessage));
  //     },
  //     (_) {
  //       CacheHelper.setData(key: 'isLogin', value: true);
  //       CacheHelper.setData(key: 'userInfo', value: UserInfo.encode(userInfo));
  //       appRepository.userInfo = userInfo;
  //       emit(SignUpSuccessState());
  //     },
  //   );
  // }
  //
  // Future<void> _onPhoneNumberAuth(
  //   PhoneNumberAuthEvent event,
  //   Emitter<SignUpState> emit,
  // ) async {
  //   emit(PhoneAuthLoadingState());
  //
  //   final result = await phoneNumberAuthenticationUseCase.call(
  //     phoneNumber: event.phoneNumber,
  //   );
  //
  //   result.fold(
  //     (failure) async {
  //       emit(PhoneAuthErrorState(
  //           failure.message ?? AppMessages.somethingWentWrongMessage));
  //     },
  //     (_) async {
  //       emit(PhoneAuthSuccessState());
  //     },
  //   );
  // }
  //
  // Future<void> _onVerifyOTPAuth(
  //   VerifyOTPCodeEvent event,
  //   Emitter<SignUpState> emit,
  // ) async {
  //   emit(VerifyOTPLoadingState());
  //
  //   final result = await verifyOTPUseCase.call(
  //     otpCode: event.otpCode,
  //   );
  //
  //   result.fold(
  //     (failure) {
  //       emit(VerifyOTPErrorState(
  //           failure.message ?? AppMessages.somethingWentWrongMessage));
  //     },
  //     (_) {
  //       emit(VerifyOTPSuccessState());
  //     },
  //   );
  // }
}
