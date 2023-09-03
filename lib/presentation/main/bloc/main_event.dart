part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}

class SetBottomMenuEvent extends MainEvent {
  final BottomMenu menu;

  SetBottomMenuEvent({required this.menu});

  @override
  List<Object?> get props => [menu];
}

class GetUserEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}
