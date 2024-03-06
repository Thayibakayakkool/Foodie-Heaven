// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
// import 'package:foodie_heaven/src/features/data/datasources/auth/auth_firebase_remote_data_source.dart';
// import 'package:foodie_heaven/src/features/data/datasources/auth/auth_firebase_remote_data_source_impl.dart';
// import 'package:mocktail/mocktail.dart';
//
// class MockAuth extends Mock implements FirebaseAuth {}
//
// void main() {
//   late AuthFirebaseRemoteDataSource authRemoteDataSource;
//   late MockAuth mockAuth;
//
//   setUp(() {
//     mockAuth = MockAuth();
//     auth = MockAuth();
//     authRemoteDataSource = AuthFirebaseRemoteDataSourceImpl();
//   });
// group('AuthFirebaseRemoteDataSource Class -', () {
//
//   test('should call forgotPassword with correct email', () async {
//     when(() => mockAuth.sendPasswordResetEmail(email:any(named: 'email')))
//         .thenAnswer((_) => Future.value());
//     // Arrange
//     const String email = 'test@example.com';
//
//     // Act
//     await authRemoteDataSource.forgotPassword(email);
//
//     // Assert
//     verify(() => mockAuth.sendPasswordResetEmail(email: email)).called(1);
//   });
// });
//
// }
