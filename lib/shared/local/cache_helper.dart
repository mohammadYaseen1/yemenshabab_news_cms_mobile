// import 'package:shared_preferences/shared_preferences.dart';
//
// class CacheHelper {
//   static late SharedPreferences sharedPreferences;
//
//   static init() async =>
//       sharedPreferences = await SharedPreferences.getInstance();
//
//   static Future<bool> setData({
//     required String key,
//     required value,
//   }) async {
//     switch (value.runtimeType) {
//       case String:
//         return await sharedPreferences.setString(key, value);
//       case bool:
//         return await sharedPreferences.setBool(key, value);
//       case int:
//         return await sharedPreferences.setInt(key, value);
//       case double:
//         return await sharedPreferences.setBool(key, value);
//     }
//     return await sharedPreferences.setStringList(key, value);
//   }
//
//   static dynamic getData({required String key}) => sharedPreferences.get(key);
//   static dynamic getListData({required String key}) => sharedPreferences.getStringList(key);
//
//   static Future<bool> removeData({required String key}) async =>
//       await sharedPreferences.remove(key);
// }
