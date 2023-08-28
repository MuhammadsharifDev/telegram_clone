import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:telegram_clone/data/model/user_contac.dart';
import 'package:telegram_clone/data/repository/user_contact_repository.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingContactState> {
  final UserContactsRepository contactsRepository;
  SettingCubit({required this.contactsRepository}) : super(SettingContactInitial()){
  fetchContactAll();
  }
  fetchContactAll(){
    emit(SettingContactInLoading());
    contactsRepository.getAllContacts().listen((List<UserContact> users){
      print('User===>${users}');
      emit(SettingContactInSuccess(contact: users));
    });
  }
}
