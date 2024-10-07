import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/core/strings/messages.dart';
import 'package:yemenshabab/features/favorite/domian/entities/favorite_info.dart';
import 'package:yemenshabab/features/favorite/domian/usecases/add_favorite.dart';
import 'package:yemenshabab/features/favorite/domian/usecases/get_favorites.dart';
import 'package:yemenshabab/features/favorite/domian/usecases/remove_favorite.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoritesUseCase getUseCase;
  final AddFavoriteUseCase addUseCase;
  final RemoveFavoriteUseCase removeUseCase;

  FavoriteBloc({
    required this.getUseCase,
    required this.addUseCase,
    required this.removeUseCase,
  }) : super(FavoriteInitialState()) {
    on<FavoriteAddEvent>((event, emit) async {
      await addUseCase.call(
          favoriteInfo: event.favoriteInfo, userId: event.userId);
      emit(AddFavoriteState());
    });

    on<FavoriteRemoveEvent>((event, emit) async {
      await removeUseCase.call(
          favoriteInfo: event.favoriteInfo, userId: event.userId);
      emit(RemoveFavoriteState());
    });

    on<FavoriteGetEvent>((event, emit) async {
      await _onFavoriteGet(event, emit);
    });
  }

  Future<void> _onFavoriteGet(
    FavoriteGetEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteLoadingState());

    final result = await getUseCase.call(userId: event.userId);

    result.fold(
      (failure) {
        emit(FavoriteErrorState(
            failure.message ?? AppMessages.somethingWentWrongMessage));
      },
      (favorites) {
        emit(FavoriteLoadedState(favorites));
      },
    );
  }
}
