part of 'splash_bloc.dart';

@immutable
abstract class SplashState extends Equatable {}

class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashEndedState extends SplashState {
  final String route;

  SplashEndedState({required this.route});

  @override
  List<Object?> get props => [route];
}
