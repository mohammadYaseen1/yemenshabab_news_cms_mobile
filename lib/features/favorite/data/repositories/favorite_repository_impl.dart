import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/exceptions.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/favorite/data/model/favorite_model.dart';
import 'package:yemenshabab/features/favorite/data/service/favorite_service.dart';
import 'package:yemenshabab/features/favorite/domian/entities/favorite_info.dart';
import 'package:yemenshabab/features/favorite/domian/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteService favoriteService;

  FavoriteRepositoryImpl({required this.favoriteService});

  @override
  Future<Either<Failure, Unit>> addFavorite(
      {required String userId, required FavoriteInfo favoriteInfo}) async {
    FavoriteModel favoriteModel = FavoriteModel(
      uuid: favoriteInfo.uuid,
      title: favoriteInfo.title,
      image: favoriteInfo.image,
    );

    try {
      return await favoriteService.addFavorite(
          userId: userId, favoriteModel: favoriteModel);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteInfo>>> getFavorites(
      {required String userId}) async {
    try {
      final result = await favoriteService.getFavorites(userId: userId);
      return result.fold(
          (failure) => Left(failure),
          (model) => Right(model
              .map(
                (favorite) => FavoriteInfo(
                  uuid: favorite.uuid,
                  title: favorite.title,
                  image: favorite.image,
                ),
              )
              .toList()));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite(
      {required String userId, required FavoriteInfo favoriteInfo}) async {
    try {
      return await favoriteService.removeFavorite(
          userId: userId,
          favoriteModel: FavoriteModel(
            uuid: favoriteInfo.uuid,
            title: favoriteInfo.title,
            image: favoriteInfo.image,
          ));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
