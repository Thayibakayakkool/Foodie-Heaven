part of 'credential_bloc.dart';

@immutable
abstract class CredentialEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogInEvent extends CredentialEvent {
  final UserEntity userEntity;

  LogInEvent({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}

class SignUpEvent extends CredentialEvent {
  final UserEntity userEntity;

  SignUpEvent({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}

class OtpEvent extends CredentialEvent {
  final String phoneNo;

  OtpEvent({required this.phoneNo});

  @override
  List<Object?> get props => [phoneNo];
}

class GoogleSignInEvent extends CredentialEvent {}

class ForgotPasswordEvent extends CredentialEvent {
  final String email;

  ForgotPasswordEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
