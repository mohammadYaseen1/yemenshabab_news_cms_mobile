import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/favorite/domian/entities/favorite_info.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<FavoriteInfo>>> getFavorites({
    required String userId,
  });

  Future<Either<Failure, Unit>> addFavorite({
    required String userId,
    required FavoriteInfo favoriteInfo,
  });

  Future<Either<Failure, Unit>> removeFavorite({
    required String userId,
    required FavoriteInfo favoriteInfo,
  });
}
