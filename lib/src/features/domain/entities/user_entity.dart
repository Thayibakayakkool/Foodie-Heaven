import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? address;
  final String? email;
  final String? password;
  final String? phoneNo;
  final String? uid;

  const UserEntity({
    this.name,
    this.address,
    this.email,
    this.password,
    this.phoneNo,
    this.uid,
  });

  @override
  List<Object?> get props => [
        name,
        address,
        email,
        password,
        uid,
        phoneNo,
      ];
}
