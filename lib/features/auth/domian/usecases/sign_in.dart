import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/auth/domian/entites/user_info.dart';
import 'package:yemenshabab/features/auth/domian/repositories/user_repository.dart';

class SignInUseCase {
  final UserRepository userRepository;

  SignInUseCase({required this.userRepository});

  Future<Either<Failure, UserInfo>> call({
    required String email,
    required String password,
  }) async {
    return await userRepository.signIn(email: email, password: password);
  }
}
