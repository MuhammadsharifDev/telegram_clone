import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState(firebaseStatus: Status.success)) {
    on<VisibleIconEvent>((event, emit) {
      emit(
        state.copyWith(visibleIcon: event.isVisible),
      );
    });
    on<SignUpEvent>(_signUp);
  }

  _signUp(SignUpEvent event, emit) async {
    emit(
      state.copyWith(firebaseStatus: Status.loading),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );


      User user = FirebaseAuth.instance.currentUser!;
      await user.updateDisplayName(event.name);

      FirebaseFirestore firebaseStorage = FirebaseFirestore.instance;
      firebaseStorage.collection('users').doc(user.uid).set({
        'name': event.name,
        'email': user.email,
        'phone': user.phoneNumber
      });
      emit(
        state.copyWith(firebaseStatus: Status.success),
      );
    } on FirebaseAuthException catch (e) {
      print('Error-->${e.code}');
      emit(
        state.copyWith(firebaseStatus: Status.error),
      );
    }
  }
}
