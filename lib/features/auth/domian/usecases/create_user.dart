import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';
import 'package:yemenshabab/features/auth/domian/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository userRepository;

  CreateUserUseCase({required this.userRepository});

  Future<Either<Failure, Unit>> call({required UserInfo userInfo}) async {
    return await userRepository.createUser(userInfo: userInfo);
  }
}
