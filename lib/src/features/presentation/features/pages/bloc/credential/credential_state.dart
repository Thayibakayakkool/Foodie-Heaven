part of 'credential_bloc.dart';

@immutable
abstract class CredentialState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CredentialInitial extends CredentialState {}

class CredentialLoading extends CredentialState {}

class CredentialLoaded extends CredentialState {}

class CredentialError extends CredentialState {
  final String errorMessage;

  CredentialError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
