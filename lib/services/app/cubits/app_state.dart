part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => [];
}

class AppInitial extends AppState {}

class SettingsLoading extends AppState {}

class SettingsLoaded extends AppState {
  final SettingEntity settings;

  const SettingsLoaded(this.settings);

  @override
  List<Object?> get props => [settings];
}

class SettingsError extends AppState {
  final String message;

  const SettingsError(this.message);

  @override
  List<Object?> get props => [message];
}
