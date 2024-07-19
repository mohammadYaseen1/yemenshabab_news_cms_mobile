import 'package:yemenshabab_news_cms_mobile/services/auth/models/user_model.dart';
import 'package:yemenshabab_news_cms_mobile/services/auth/repositories/auth_repository.dart';

class AuthService {
  final AuthRepository authRepository;

  AuthService({required this.authRepository});

  Future<User?> login({required String email, required String password}) {
    return authRepository.login(email, password);
  }

// Add other authentication-related methods here
}
