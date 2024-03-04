import 'package:foodie_heaven/src/features/data/repositories/auth_repositories_impl.dart';
import 'package:foodie_heaven/src/features/domain/entities/user_entity.dart';
import 'package:foodie_heaven/src/features/domain/repositories/auth_repo.dart';

class AuthUseCases {
  final AuthRepo authRepo = AuthRepoImpl();

  Future<void> logIn(UserEntity userEntity) {
    return authRepo.logIn(userEntity);
  }

  Future<void> signUp(UserEntity userEntity) {
    return authRepo.signUp(userEntity);
  }

  Future<bool> isLogIn() {
    return authRepo.isLogIn();
  }

  Future<void> logOut() {
    return authRepo.logOut();
  }

  Future<void> forgotPassword(String email) {
    return authRepo.forgotPassword(email);
  }

  Future<void> googleAuth() {
    return authRepo.googleAuth();
  }

  Future<void> getCreateCurrentUser(UserEntity userEntity) {
    return authRepo.getCreateCurrentUser(userEntity);
  }

  Future<String> getCurrentUserId() {
    return authRepo.getCurrentUserId();
  }
}
