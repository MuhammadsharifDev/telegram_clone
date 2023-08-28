import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telegram_clone/routes/routes_name.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  SplashBloc() : super(SplashInitial()) {
    on<SplashInitEvent>((event, emit) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        emit(SplashEndedState(route: RoutesName.main));
      } else {
        emit(SplashEndedState(route: RoutesName.login));
      }
    },
    );
  }
}
