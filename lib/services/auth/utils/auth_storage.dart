import 'package:yemenshabab/shared/local/cache_helper.dart';

class AuthStorage {
  static const _tokenKey = 'auth_token';

  static Future<void> saveToken(String token) async {
    await CacheHelper.setData(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await CacheHelper.getData(key: _tokenKey);
  }

  static Future<void> clearToken() async {
    await CacheHelper.removeData(key: _tokenKey);
  }
}
