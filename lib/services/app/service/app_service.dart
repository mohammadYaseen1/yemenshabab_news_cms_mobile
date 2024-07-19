import 'package:yemenshabab_news_cms_mobile/services/app/models/setting_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/app/repositories/app_repository.dart';

class AppService {
  final AppRepository appRepository;

  AppService({required this.appRepository});

  Future<SettingEntity> fetchSettings() async {
    return await appRepository.fetchSettings();
  }
}
