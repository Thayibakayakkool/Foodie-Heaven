import 'package:foodie_heaven/src/features/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<void> signUp(UserEntity userEntity);

  Future<void> logIn(UserEntity userEntity);

  Future<bool> isLogIn();

  Future<void> logOut();

  Future<void> forgotPassword(String email);

  Future<void> googleAuth();

  Future<void> getCreateCurrentUser(UserEntity userEntity);

  Future<String> getCurrentUserId();
}
