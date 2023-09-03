part of 'main_bloc.dart';

@immutable
class MainState extends Equatable {
  final BottomMenu bottomMenu;
  final User? user;

  const MainState({
    this.bottomMenu = BottomMenu.chat,
    this.user,
  });

  MainState copyWith({
    BottomMenu? bottomMenu,
    User? user,
  }) =>
      MainState(
        bottomMenu: bottomMenu ?? this.bottomMenu,
        user: user ?? this.user,
      );

  @override
  List<Object?> get props => [bottomMenu, user];
}
