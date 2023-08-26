part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class VisibleEvent extends LoginEvent {
  final bool isVisible;

  VisibleEvent({required this.isVisible});
}

class SignInEvent extends LoginEvent {
  final String email;
  final String password;

  SignInEvent({required this.password, required this.email});

  @override
  List<Object?> get props => [];
}
