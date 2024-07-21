import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/writer_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/service/home_service.dart';

part 'writer_state.dart';

class WriterCubit extends Cubit<WriterState> {
  final HomeService homeService;

  WriterCubit({required this.homeService}) : super(WriterInitial());

  Future<void> fetchWriters(String uuid) async {
    try {
      emit(ListWritersLoading());
      final writer = await homeService.fetchWriters(uuid: uuid, rows: 0);
      emit(ListWritersLoaded(writer));
    } catch (e) {
      emit(ListWritersError('Failed to fetch writers', e.toString()));
    }
  }
}
