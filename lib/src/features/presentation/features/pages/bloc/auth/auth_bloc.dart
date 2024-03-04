import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStartedEvent>(_appStartedEvent);
    on<LoggedInEvent>(_loggedInEvent);
    on<LogOutEvent>(_logOutEvent);
  }

  void _appStartedEvent(AppStartedEvent event, Emitter<AuthState> emit) async {
    try {
      final isSignIn = await authUseCases.isLogIn();
      if (isSignIn) {
        final uid = await authUseCases.getCurrentUserId();
        emit(AuthenticatedState(uid: uid));
      } else {
        emit(UnAuthenticatedState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  void _loggedInEvent(LoggedInEvent event, Emitter<AuthState> emit) async {
    try {
      final uid = await authUseCases.getCurrentUserId();
      emit(AuthenticatedState(uid: uid));
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  void _logOutEvent(LogOutEvent event, Emitter<AuthState> emit) async {
    try {
      await authUseCases.logOut();
      emit(UnAuthenticatedState());
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }
}
