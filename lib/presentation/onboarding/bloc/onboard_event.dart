part of 'onboard_bloc.dart';

@immutable
abstract class OnboardEvent {}
class PageViewEvent extends OnboardEvent{
  PageViewEvent();
  @override
  List<Object?> get props=>[];
}