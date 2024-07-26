import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemenshabab/data/models/playlist_entity.dart';
import 'package:yemenshabab/services/home/service/home_service.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  final HomeService homeService;

  PlaylistCubit({required this.homeService}) : super(PlaylistInitial());

  Future<void> fetchPlaylist(String id, int count) async {
    try {
      emit(PlaylistLoading());
      final playlist = await homeService.fetchPlaylist(id, count);
      emit(PlaylistLoaded(playlist));
    } catch (e) {
      emit(PlaylistError('Failed to fetch playlist [$id]',
          description: e.toString()));
    }
  }
}
