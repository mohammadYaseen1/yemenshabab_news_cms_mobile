part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpSubmitEvent extends SignUpEvent {
  final String email;
  final String password;
  final String name;
  final String uuid;

  SignUpSubmitEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.uuid,
  });

  @override
  List<Object> get props => [email, password, name, uuid];
}

class PhoneNumberAuthEvent extends SignUpEvent {
  final String email;

  PhoneNumberAuthEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class VerifyOTPCodeEvent extends SignUpEvent {
  final String otpCode;

  VerifyOTPCodeEvent({
    required this.otpCode,
  });

  @override
  List<Object> get props => [otpCode];
}

class TogglePasswordVisibilityEvent extends SignUpEvent {}

class ToggleConfirmPasswordVisibilityEvent extends SignUpEvent {}

class SelectGenderEvent extends SignUpEvent {
  final int gender;

  SelectGenderEvent(this.gender);

  @override
  List<Object?> get props => [gender];
}

class SelectCountryCodeEvent extends SignUpEvent {
  final String countryCode;

  SelectCountryCodeEvent(this.countryCode);

  @override
  List<Object?> get props => [countryCode];
}
