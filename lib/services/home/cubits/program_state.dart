part of 'program_cubit.dart';

abstract class ProgramState extends Equatable {
  const ProgramState();

  @override
  List<Object?> get props => [];
}

class ProgramInitial extends ProgramState {}

class ListProgramsLoading extends ProgramState {}

class ListProgramsLoaded extends ProgramState {
  final ProgramEntity program;

  const ListProgramsLoaded(this.program);

  @override
  List<Object?> get props => [program];
}

class ListProgramsError extends ProgramState {
  final String message;

  const ListProgramsError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProgramLoading extends ProgramState {}

class ProgramLoaded extends ProgramState {
  final ProgramPrograms program;

  const ProgramLoaded(this.program);

  @override
  List<Object?> get props => [program];
}

class ProgramError extends ProgramState {
  final String message;

  const ProgramError(this.message);

  @override
  List<Object?> get props => [message];
}
