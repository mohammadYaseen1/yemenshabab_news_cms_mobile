import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yemenshabab/services/auth/models/user_model.dart';
import 'package:yemenshabab/services/auth/routes/news_routes.dart';

class AuthRepository {
  Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(AuthRoutes.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      // Handle error
      return null;
    }
  }

  Future<void> register(User user) async {
    // Implement registration logic with Keycloak
  }
  // Additional methods for register, etc.
}
