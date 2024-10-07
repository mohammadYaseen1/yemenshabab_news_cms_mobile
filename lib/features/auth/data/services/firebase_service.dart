import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yemenshabab/core/error/exceptions.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/auth/data/models/user_model.dart';
import 'package:yemenshabab/features/favorite/data/model/favorite_model.dart';

abstract class FirebaseService {
  Future<Either<Failure, Unit>> createUser({required UserModel user});

  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signOut();
}

class FirebaseServiceImpl extends FirebaseService {
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;
  static String? verificationId;

  FirebaseServiceImpl({required this.fireStore, required this.auth});

  @override
  Future<Either<Failure, Unit>> createUser({
    required UserModel user,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password!);

      await userCredential.user!.updateDisplayName(user.name);

      return const Right(unit);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserModel userModel;
      var userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      userModel = UserModel(
          uuid: userCredential.user!.uid,
          name: userCredential.user?.displayName ?? "",
          email: userCredential.user?.email ?? "");
      return Right(userModel);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await auth.signOut();
      return const Right(unit);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
