part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class VisibleIconEvent extends SignupEvent {
  final bool isVisible;

  VisibleIconEvent({required this.isVisible});
}

class SignUpEvent extends SignupEvent {
  final String email;
  final String password;
  final String name;
  final String phoneNumber;

  SignUpEvent({
    required this.phoneNumber,
    required this.password,
    required this.email,
    required this.name,
  });
}
