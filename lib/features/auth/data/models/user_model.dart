
import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';

class UserModel extends UserInfo {
  const UserModel({
    required super.name,
    required super.email,
    required super.uuid,
     super.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uuid': uuid,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      uuid: map['uuid'],
      password: map['password'],
    );
  }
}
