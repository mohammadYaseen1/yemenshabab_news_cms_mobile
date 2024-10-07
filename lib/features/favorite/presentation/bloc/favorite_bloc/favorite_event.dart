part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteGetEvent extends FavoriteEvent {
  final String userId;

  FavoriteGetEvent({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class FavoriteRemoveEvent extends FavoriteEvent {
  final String userId;
  final FavoriteInfo favoriteInfo;

  FavoriteRemoveEvent({
    required this.userId,
    required this.favoriteInfo,
  });

  @override
  List<Object> get props => [userId, favoriteInfo];
}

class FavoriteAddEvent extends FavoriteEvent {
  final String userId;
  final FavoriteInfo favoriteInfo;

  FavoriteAddEvent({
    required this.userId,
    required this.favoriteInfo,
  });

  @override
  List<Object> get props => [userId, favoriteInfo];
}
