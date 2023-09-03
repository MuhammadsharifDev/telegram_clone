import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<SetBottomMenuEvent>(_onChanged);
    on<GetUserEvent>(_getUser);
  }

  void _onChanged(SetBottomMenuEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(bottomMenu: event.menu));
  }

  void _getUser(GetUserEvent event, Emitter<MainState> emit) async {
    User? user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      state.copyWith(user: user),
    );
  }
}

enum BottomMenu { chat, contacts, setting }
