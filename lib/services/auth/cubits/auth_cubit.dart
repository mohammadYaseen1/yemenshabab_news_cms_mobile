import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemenshabab_news_cms_mobile/services/auth/models/user_model.dart';
import 'package:yemenshabab_news_cms_mobile/services/auth/service/auth_service.dart';
import 'package:yemenshabab_news_cms_mobile/services/auth/utils/auth_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit({required this.authService}) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authService.login(email: email, password: password);
      if (user != null) {
        emit(AuthLoaded(user));
        AuthStorage.saveToken(user.token);
      } else {
        emit(AuthError('Login failed'));
      }
    } catch (e) {
      emit(AuthError('An error occurred'));
    }
  }

  Future<void> register(User user) async {
    // try {
    //   await authService.register(user);
    //   emit(AuthRegisterSuccessState());
    // } catch (e) {
    //   emit(AuthErrorState(e.toString()));
    // }
  }


// Additional methods for register, etc.
}
