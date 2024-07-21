part of 'writer_cubit.dart';

abstract class WriterState extends Equatable {
  const WriterState();

  @override
  List<Object?> get props => [];
}

class WriterInitial extends WriterState {}

class ListWritersLoading extends WriterState {}

class ListWritersLoaded extends WriterState {
  final WriterEntity writer;

  const ListWritersLoaded(this.writer);

  @override
  List<Object?> get props => [writer];
}

class ListWritersError extends WriterState {
  final String message;
  final String description;

  const ListWritersError(this.message, this.description);

  @override
  List<Object?> get props => [message, description];
}
