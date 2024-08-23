import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String fullName;
  final String phoneNumber;

  const UserInfo({
    required this.fullName,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        fullName,
        phoneNumber,
      ];

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }

  static String encode(UserInfo userInfo) => json.encode(userInfo.toJson());

  static UserInfo decode(String userInfo) =>
      UserInfo.fromJson(json.decode(userInfo) as Map<String, dynamic>);
}
