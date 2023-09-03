import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<VisibleEvent>(_isVisible);
    on<SignInEvent>(_signIn);
    on<RegstrWithGoogleEvent>(_regstrWithGoogle);
  }

  void _isVisible(VisibleEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(visibleIcon: event.isVisible));
  }

  Future<void> _signIn(SignInEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(firebaseStatus: Status.loading));
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password);
      emit(state.copyWith(firebaseStatus: Status.success));
    }on FirebaseAuthException catch(e){
      print('Error-->${e.code}');
      emit(state.copyWith(firebaseStatus: Status.error));
    }
  }

  Future<void> _regstrWithGoogle(
      RegstrWithGoogleEvent event, Emitter<LoginState> emit) async {
    final _googleSign = GoogleSignIn(scopes: [
      'email',
    ]);
    try {
      final GoogleSignInAccount? googleUser = await _googleSign.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return null;
    } catch (e, s) {
      debugPrint('$e, $s');
      return null;
    }
  }
}
