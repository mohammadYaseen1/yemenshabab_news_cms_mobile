part of 'playlist_cubit.dart';

abstract class PlaylistState extends Equatable {
  const PlaylistState();

  @override
  List<Object?> get props => [];
}

class PlaylistInitial extends PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistLoaded extends PlaylistState {
  final PlaylistEntity playlist;

  const PlaylistLoaded(this.playlist);

  @override
  List<Object?> get props => [playlist];
}

class PlaylistError extends PlaylistState {
  final String message;
  final String? description;

  const PlaylistError(this.message, {this.description});

  @override
  List<Object?> get props => [message, description];
}
