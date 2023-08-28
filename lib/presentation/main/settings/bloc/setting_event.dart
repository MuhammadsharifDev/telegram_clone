part of 'setting_bloc.dart';

@immutable
abstract class SettingEvent extends Equatable {
  const SettingEvent();
}

class AddContactEvent extends SettingEvent {
  final UserContact contactModel;

  const AddContactEvent({required this.contactModel});

  @override
  List<Object?> get props => [contactModel];
}

class UpdateContactEvent extends SettingEvent {
  final UserContact contactModel;

  const UpdateContactEvent({required this.contactModel});

  @override
  List<Object?> get props => [contactModel];
}


class DeleteContactEvent extends SettingEvent {
  final String contactId;

  const DeleteContactEvent({required this.contactId});

  @override
  List<Object?> get props => [contactId];
}
