part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TogglePasswordVisibilityEvent extends SignInEvent {}

class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmitEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SelectCountryCodeEvent extends SignInEvent {
  final String countryCode;

  SelectCountryCodeEvent(this.countryCode);

  @override
  List<Object?> get props => [countryCode];
}

class SignUpEvent extends SignInEvent {}
