import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<VisibleEvent>(_isVisible);
    on<SignInEvent>(_signIn);
  }

  void _isVisible(VisibleEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(visibleIcon: event.isVisible));
  }

  Future<void> _signIn(SignInEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(firebaseStatus: Status.loading));
    try {
      final user = FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password) as User?;
      if (user != null) {
        emit(state.copyWith(isUserSignIn: true));
      }
      emit(state.copyWith(firebaseStatus: Status.success));
    } on FirebaseAuthException catch (e) {
      print('ERROR==>${e.message}');
      emit(state.copyWith(firebaseStatus: Status.error));
    }
  }
}
