import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';

class UserModel extends UserInfo {
  const UserModel({
    required super.fullName,
    required super.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
