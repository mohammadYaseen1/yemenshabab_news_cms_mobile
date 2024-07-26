import 'package:yemenshabab/services/app/models/setting_entity.dart';
import 'package:yemenshabab/services/app/routes/app_routes.dart';
import 'package:yemenshabab/shared/network/dio_factory.dart';

class AppRepository {
  final dioFactory = DioFactory();

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
