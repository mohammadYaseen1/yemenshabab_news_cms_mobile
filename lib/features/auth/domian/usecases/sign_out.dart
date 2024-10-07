import 'package:dartz/dartz.dart';
import 'package:yemenshabab/core/error/failures.dart';
import 'package:yemenshabab/features/auth/domian/repositories/user_repository.dart';

  class SignOutUseCase {
  final UserRepository userRepository;

  SignOutUseCase({required this.userRepository});

  Future<Either<Failure, Unit>> call() async {
    return await userRepository.signOut();
  }
}
