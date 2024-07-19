import 'package:yemenshabab_news_cms_mobile/services/app/cubits/app_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/services/app/repositories/app_repository.dart';
import 'package:yemenshabab_news_cms_mobile/services/app/service/app_service.dart';

class AppController {
  final AppCubit appCubit;

  AppController()
      : appCubit = AppCubit(
          appService: AppService(appRepository: AppRepository()),
        );

  void fetchSetting() {}
}
