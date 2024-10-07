import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String name;
  final String email;
  final String uuid;
  final String? password;

  const UserInfo({
    required this.name,
    required this.email,
    required this.uuid,
    this.password,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        uuid,
        password,
      ];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uuid': uuid,
      'password': password,
    };
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name: json['name'] as String,
      email: json['email'] as String,
      uuid: json['uuid'] as String,
      password: json['password'] as String?,
    );
  }

  static String encode(UserInfo userInfo) => json.encode(userInfo.toJson());

  static UserInfo decode(String userInfo) =>
      UserInfo.fromJson(json.decode(userInfo) as Map<String, dynamic>);
}
