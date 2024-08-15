part of 'program_schedule_cubit.dart';

abstract class ProgramScheduleState extends Equatable {
  const ProgramScheduleState();

  @override
  List<Object?> get props => [];
}

class ProgramScheduleInitial extends ProgramScheduleState {}

class ProgramsScheduleLoading extends ProgramScheduleState {}

class ProgramsScheduleLoaded extends ProgramScheduleState {
  final ProgramSchedule program;

  const ProgramsScheduleLoaded(this.program);

  @override
  List<Object?> get props => [program];
}

class ProgramsScheduleError extends ProgramScheduleState {
  final String message;
  final String description;

  const ProgramsScheduleError(this.message, this.description);

  @override
  List<Object?> get props => [message, description];
}
