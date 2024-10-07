import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/favorite/domian/entities/favorite_info.dart';
import 'package:yemenshabab/features/favorite/domian/repositories/favorite_repository.dart';

class AddFavoriteUseCase {
  final FavoriteRepository favoriteRepository;

  AddFavoriteUseCase({required this.favoriteRepository});

  Future<Either<Failure, Unit>> call({
    required String userId,
    required FavoriteInfo favoriteInfo,
  }) async {
    return await favoriteRepository.addFavorite(
      userId: userId,
      favoriteInfo: favoriteInfo,
    );
  }
}
