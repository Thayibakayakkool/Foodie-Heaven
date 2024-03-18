import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/features/data/datasources/auth/auth_firebase_remote_data_source.dart';
import 'package:foodie_heaven/src/features/data/models/user_model.dart';
import 'package:foodie_heaven/src/features/domain/entities/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFirebaseRemoteDataSourceImpl implements AuthFirebaseRemoteDataSource {
final FirebaseAuth firebaseAuth;

  AuthFirebaseRemoteDataSourceImpl({required this.firebaseAuth});
  @override
  Future<void> forgotPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity userEntity) async {
    final uid = await getCurrentUserId();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
              name: userEntity.name,
              address: userEntity.address,
              email: userEntity.email,
              phoneNo: userEntity.phoneNo,
              uid: uid)
          .toDocument();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUserId() async => firebaseAuth.currentUser!.uid;

  @override
  Future<void> googleAuth() async {
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await account!.authentication;
    final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final userInformation = (await auth.signInWithCredential(credential)).user;
    getCreateCurrentUser(UserEntity(
        name: userInformation!.displayName, email: userInformation.email));
  }

  @override
  Future<bool> isLogIn() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future<void> logIn(UserEntity userEntity) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: userEntity.email!, password: userEntity.password!);
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> signUp(UserEntity userEntity) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: userEntity.email!, password: userEntity.password!);
  }


}
