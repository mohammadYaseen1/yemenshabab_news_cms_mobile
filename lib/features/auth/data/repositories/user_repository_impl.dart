import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/exceptions.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/auth/data/models/user_model.dart';
import 'package:yemenshabab/features/auth/data/services/firebase_service.dart';
import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';
import 'package:yemenshabab/features/auth/domian/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseService firebaseService;

  UserRepositoryImpl({required this.firebaseService});

  @override
  Future<Either<Failure, Unit>> createUser({required UserInfo userInfo}) async {
    UserModel userModel = UserModel(
      name: userInfo.name,
      email: userInfo.email,
      password: userInfo.password,
      uuid: userInfo.uuid,
    );

    try {
      final result = await firebaseService.createUser(user: userModel);

      return result;
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfo>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await firebaseService.signIn(
        email: email,
        password: password,
      );

      return result.fold(
        (failure) => Left(failure),
        (userModel) => Right(UserInfo(
          name: userModel.name,
          email: userModel.email,
          password: userModel.password,
          uuid: userModel.uuid,
        )),
      );
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      return await firebaseService.signOut();
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.msg));
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
