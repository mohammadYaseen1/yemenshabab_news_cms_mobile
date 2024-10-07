import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> createUser({
    required UserInfo userInfo,
  });

  Future<Either<Failure, UserInfo>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signOut();
}
