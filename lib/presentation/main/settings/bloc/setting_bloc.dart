import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:telegram_clone/data/model/user_contac.dart';
import 'package:telegram_clone/data/repository/user_contact_repository.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc({required this.contactsRepository}) : super(SettingState()) {
    on<AddContactEvent>((event, emit) {
      emit(
        state.copyWith(status: ContactStateStatus.loading),
      );
      contactsRepository.addContact(contactModel: event.contactModel);
      emit(
        state.copyWith(status: ContactStateStatus.contactAdded),
      );
    });

    ///________________________UPDATE______________
    on<UpdateContactEvent>((event, emit) {
      emit(
        state.copyWith(status: ContactStateStatus.loading),
      );
      contactsRepository.updateContact(contactModel: event.contactModel);
      emit(
        state.copyWith(status: ContactStateStatus.contactAdded),
      );
    });

    ///________________________DELETE_______________
    on<DeleteContactEvent>((event, emit) {
      emit(
        state.copyWith(status: ContactStateStatus.loading),
      );
      contactsRepository.deleteContact(docId: event.contactId);
      emit(
        state.copyWith(status: ContactStateStatus.contactDeleted),
      );
    });
  }

  final UserContactsRepository contactsRepository;
}
