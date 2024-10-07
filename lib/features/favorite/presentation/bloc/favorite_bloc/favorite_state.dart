part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteLoadedState extends FavoriteState {
  final List<FavoriteInfo> favorite;

  FavoriteLoadedState(this.favorite);

  @override
  List<Object?> get props => [favorite];
}

class FavoriteErrorState extends FavoriteState {
  final String errorMessage;

  FavoriteErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class AddFavoriteState extends FavoriteState {}

class RemoveFavoriteState extends FavoriteState {}
