part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {
  final int index;
  final NavBarWidget widget;

  const ChangeBottomNavState({
    required this.index,
    required this.widget,
  });

  @override
  List<Object?> get props => [index, widget, identityHashCode(this)];
}

class OpenLivePageState extends HomeState {}

class LandingLoading extends HomeState {}

class LandingLoaded extends HomeState {
  final HomeModel homeModel;

  const LandingLoaded(this.homeModel);

  @override
  List<Object?> get props => [homeModel];
}

class LandingError extends HomeState {
  final String message;
  final String? description;

  const LandingError(this.message, [this.description]);

  @override
  List<Object?> get props => [message, description];
}

class SectionsLoading extends HomeState {}

class SectionsLoaded extends HomeState {
  // final Landing home;

  const SectionsLoaded();

// @override
// List<Object?> get props => [home];
}

class SectionsError extends HomeState {
  final String message;

  const SectionsError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProgramsLoading extends HomeState {}

class ProgramsLoaded extends HomeState {
  final ProgramEntity program;

  const ProgramsLoaded(this.program);

  @override
  List<Object?> get props => [program];
}

class ProgramsError extends HomeState {
  final String message;

  const ProgramsError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProgramsScheduleLoading extends HomeState {}

class ProgramsScheduleLoaded extends HomeState {
  final ProgramSchedule program;

  const ProgramsScheduleLoaded(this.program);

  @override
  List<Object?> get props => [program];
}

class ProgramsScheduleError extends HomeState {
  final String message;

  const ProgramsScheduleError(this.message);

  @override
  List<Object?> get props => [message];
}

class CategoryDataLoading extends HomeState {}

class CategoryDataLoaded extends HomeState {}

class CategoryDataError extends HomeState {
  final String message;
  final String? description;

  const CategoryDataError(this.message, [this.description]);

  @override
  List<Object?> get props => [message, description];
}
