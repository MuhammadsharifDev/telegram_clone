part of 'setting_cubit.dart';

@immutable
abstract class SettingContactState {}

class SettingContactInitial extends SettingContactState{}

class SettingContactInLoading extends SettingContactState {}

class SettingContactInSuccess extends SettingContactState {
  SettingContactInSuccess({required this.contact});

  final List<UserContact> contact;
}