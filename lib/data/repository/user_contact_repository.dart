import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telegram_clone/core/widgets/toast_widget/toast_wdget.dart';
import 'package:telegram_clone/data/model/user_contac.dart';

class UserContactsRepository {
  final FirebaseFirestore firestore;

  UserContactsRepository({required this.firestore});

  /// ------------------------- CREATE CONTACT -------------------------

  Future<void> addContact({required UserContact contactModel}) async {
    try {
      DocumentReference newContact =
          await firestore.collection("Contacts").add(contactModel.toJson());
      await firestore
          .collection("Contacts")
          .doc(newContact.id)
          .update({"contactId": newContact.id});
      getMyToast(message: 'Contact muvaffaqiyatli saqlandi');
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  /// ------------------------- READ CONTACTS -------------------------

  Stream<List<UserContact>> getAllContacts() => firestore
      .collection("Contacts")
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((e) => UserContact.fromJson(e.data()))
          .toList());

  /// ------------------------- UPDATE CONTACT -------------------------

  Future<void> updateContact({required UserContact contactModel}) async {
    try {
      await firestore
          .collection("Contacts")
          .doc(contactModel.contactId)
          .update(contactModel.toJson());
      getMyToast(message: "Contact muvaffaqiyatli yangilandi!");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  /// ------------------------- DELETE CONTACT -------------------------

  Future<void> deleteContact({required String docId}) async {
    try {
      await firestore.collection("Contacts").doc(docId).delete();
      getMyToast(message: "Contact muvaffaqiyatli o'chirildi");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }
}
