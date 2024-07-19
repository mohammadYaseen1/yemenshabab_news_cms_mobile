import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemenshabab_news_cms_mobile/services/app/models/setting_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/app/service/app_service.dart';
import 'package:yemenshabab_news_cms_mobile/shared/config/config.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AppService appService;

  AppCubit({required this.appService}) : super(AppInitial());

  Future<void> fetchSettings() async {
    try {
      emit(SettingsLoading());
      final settings = await appService.fetchSettings();
      Config.settings = settings;
      emit(SettingsLoaded(settings));
    } catch (e) {
      emit(SettingsError('Failed to fetch settings'));
    }
  }
}
