import 'dart:convert';

import 'package:equatable/equatable.dart';

class FavoriteInfo extends Equatable {
  final String uuid;
  final String title;
  final String image;

  const FavoriteInfo({
    required this.title,
    required this.image,
    required this.uuid,
  });

  @override
  List<Object?> get props => [
        title,
        image,
        uuid,
      ];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'uuid': uuid,
    };
  }

  factory FavoriteInfo.fromJson(Map<String, dynamic> json) {
    return FavoriteInfo(
      title: json['title'] as String,
      image: json['image'] as String,
      uuid: json['uuid'] as String,
    );
  }

  static String encode(FavoriteInfo userInfo) => json.encode(userInfo.toJson());

  static FavoriteInfo decode(String userInfo) =>
      FavoriteInfo.fromJson(json.decode(userInfo) as Map<String, dynamic>);
}
