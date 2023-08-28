part of 'setting_bloc.dart';

@immutable
class SettingState extends Equatable {
  ContactStateStatus status;

  SettingState({this.status = ContactStateStatus.initial});

  SettingState copyWith({ContactStateStatus? status}) {
    return SettingState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}

enum ContactStateStatus {
  loading,
  initial,
  contactAdded,
  contactUpdated,
  contactDeleted,
  contactFetched,
}
