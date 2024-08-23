import 'package:yemenshabab/core/helper/dio_helper.dart';
import 'package:yemenshabab/services/app/models/setting_entity.dart';
import 'package:yemenshabab/services/app/routes/app_routes.dart';

class AppRepository {
  final dioFactory = DioHelper();

  Future<SettingEntity> fetchSettings() async {
    var dio = await dioFactory.getDio();
    final response = await dio.get(AppRoutes.fetchSettings);

    if (response.statusCode == 200) {
      return SettingEntity.fromJson(response.data);
    } else {
      throw Exception('Failed to load settings');
    }
  }
}
