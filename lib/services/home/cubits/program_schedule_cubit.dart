import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemenshabab/data/models/program_schedule.dart';
import 'package:yemenshabab/services/home/service/home_service.dart';

part 'program_schedule_state.dart';

class ProgramScheduleCubit extends Cubit<ProgramScheduleState> {
  final HomeService homeService;

  ProgramScheduleCubit({required this.homeService})
      : super(ProgramScheduleInitial());

  Future<void> fetchProgramsSchedule() async {
    try {
      emit(ProgramsScheduleLoading());
      final program = await homeService.fetchProgramsSchedule();
      emit(ProgramsScheduleLoaded(program));
    } catch (e) {
      emit(ProgramsScheduleError(
          'Failed to fetch programs schedule', e.toString()));
    }
  }
}
