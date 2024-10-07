import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/favorite/domian/entities/favorite_info.dart';
import 'package:yemenshabab/features/favorite/domian/repositories/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoriteRepository favoriteRepository;

  GetFavoritesUseCase({required this.favoriteRepository});

  Future<Either<Failure, List<FavoriteInfo>>> call(
      {required String userId}) async {
    return await favoriteRepository.getFavorites(userId: userId);
  }
}
