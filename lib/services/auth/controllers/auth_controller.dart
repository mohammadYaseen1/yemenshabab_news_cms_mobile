import 'package:yemenshabab_news_cms_mobile/services/auth/cubits/auth_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/services/auth/models/user_model.dart';
import 'package:yemenshabab_news_cms_mobile/services/auth/repositories/auth_repository.dart';
import 'package:yemenshabab_news_cms_mobile/services/auth/service/auth_service.dart';
import 'package:yemenshabab_news_cms_mobile/services/news/cubits/news_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/services/news/service/new_service.dart';


class AuthController {
  final AuthCubit authCubit;

  AuthController()
      : authCubit = AuthCubit(
    authService: AuthService(authRepository: AuthRepository()),
  );

  void login(String email, String password) {
    authCubit.login(email, password);
  }

  void register(String email, String password) {
    // authCubit.register(User());
  }

}