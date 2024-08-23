part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppInitialState extends AppState {}

class AppLoadingState extends AppState {}

class AppErrorState extends AppState {
  final String message;

  AppErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
