import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/core/config/config.dart';
import 'package:yemenshabab/services/app/models/setting_entity.dart';
import 'package:yemenshabab/services/app/service/app_service.dart';

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
      emit(const SettingsError('Failed to fetch settings'));
    }
  }
}
