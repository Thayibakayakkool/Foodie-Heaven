import 'package:foodie_heaven/src/features/data/datasources/auth/auth_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/data/datasources/auth/auth_firebase_remote_data_source_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/user_entity.dart';
import 'package:foodie_heaven/src/features/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthFirebaseRemoteDataSource remoteDataSource =
      AuthFirebaseRemoteDataSourceImpl();

  @override
  Future<void> forgotPassword(String email) async =>
      await remoteDataSource.forgotPassword(email);

  @override
  Future<void> getCreateCurrentUser(UserEntity userEntity) async =>
      await remoteDataSource.getCreateCurrentUser(userEntity);

  @override
  Future<String> getCurrentUserId() async =>
      await remoteDataSource.getCurrentUserId();

  @override
  Future<void> googleAuth() async => await remoteDataSource.googleAuth();

  @override
  Future<bool> isLogIn() async => await remoteDataSource.isLogIn();

  @override
  Future<void> logIn(UserEntity userEntity) async =>
      await remoteDataSource.logIn(userEntity);

  @override
  Future<void> logOut() async => remoteDataSource.logOut();

  @override
  Future<void> signUp(UserEntity userEntity) async =>
      await remoteDataSource.signUp(userEntity);
}
