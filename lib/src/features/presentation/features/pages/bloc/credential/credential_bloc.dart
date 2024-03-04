import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/features/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

part 'credential_event.dart';

part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  CredentialBloc() : super(CredentialInitial()) {
    on<LogInEvent>(_logInEvent);
    on<SignUpEvent>(_signUpEvent);
    on<GoogleSignInEvent>(_googleSignInEvent);
    on<ForgotPasswordEvent>(_forgotPasswordEvent);
  }

  void _logInEvent(LogInEvent event, Emitter<CredentialState> emit) async {
    emit(CredentialLoading());
    try {
      await authUseCases.logIn(event.userEntity);
      emit(CredentialLoaded());
    } on FirebaseAuthException catch (e) {
      emit(CredentialError(errorMessage: e.message.toString()));
    }
  }

  void _signUpEvent(SignUpEvent event, Emitter<CredentialState> emit) async {
    emit(CredentialLoading());
    try {
      await authUseCases.signUp(event.userEntity);
      await authUseCases.getCreateCurrentUser(event.userEntity);
      emit(CredentialLoaded());
    } on FirebaseAuthException catch (e) {
      emit(CredentialError(errorMessage: e.message.toString()));
    }
  }

  void _googleSignInEvent(
      GoogleSignInEvent event, Emitter<CredentialState> emit) async {
    try {
      await authUseCases.googleAuth();
    } on FirebaseAuthException catch (e) {
      emit(CredentialError(errorMessage: e.message.toString()));
    }
  }

  void _forgotPasswordEvent(
      ForgotPasswordEvent event, Emitter<CredentialState> emit) async {
    try {
      authUseCases.forgotPassword(event.email);
    } on FirebaseAuthException catch (e) {
      emit(CredentialError(errorMessage: e.message.toString()));
    }
  }
}
