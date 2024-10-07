import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/exceptions.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/favorite/data/model/favorite_model.dart';

abstract class FavoriteService {
  Future<Either<Failure, List<FavoriteModel>>> getFavorites({
    required String userId,
  });

  Future<Either<Failure, Unit>> addFavorite({
    required String userId,
    required FavoriteModel favoriteModel,
  });

  Future<Either<Failure, Unit>> removeFavorite({
    required String userId,
    required FavoriteModel favoriteModel,
  });
}

class FavoriteServiceImpl extends FavoriteService {
  final FirebaseFirestore fireStore;

  FavoriteServiceImpl({required this.fireStore});

  @override
  Future<Either<Failure, Unit>> addFavorite(
      {required String userId, required FavoriteModel favoriteModel}) async {
    try {
      await fireStore
          .collection('favorite')
          .doc(userId)
          .set(favoriteModel.toMap());

      return const Right(unit);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteModel>>> getFavorites(
      {required String userId}) async {
    try {
      var result = await fireStore.collection('favorite').doc(userId).get();

      print("DATA");
      print("\n\n\n\n\n");
      print(result.data());
      print("\n\n\n\n\n");
      print("\n\n\n\n\n");

      return Right([]);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite(
      {required String userId, required FavoriteModel favoriteModel}) async {
    try {
      await fireStore.collection('favorite').doc(userId).update({
        'items': FieldValue.arrayRemove([favoriteModel]),
      });
      return const Right(unit);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
