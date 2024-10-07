import 'package:yemenshabab/features/favorite/domian/entities/favorite_info.dart';

class FavoriteModel extends FavoriteInfo {
  const FavoriteModel({
    required super.uuid,
    required super.title,
    required super.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'title': title,
      'image': image,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      uuid: map['uuid'],
      title: map['title'],
      image: map['image'],
    );
  }
}
