import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_heaven/src/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.name,
    super.address,
    super.email,
    super.password,
    super.phoneNo,
    super.uid,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.get('name'),
      address: snapshot.get('address'),
      email: snapshot.get('email'),
      password: snapshot.get('password'),
      phoneNo: snapshot.get('phoneNo'),
      uid: snapshot.get('uid'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'address': address,
      'email': email,
      'phoneNo': phoneNo,
      'uid': uid
    };
  }
}
