import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/services/home/models/program/program_entity.dart';
import 'package:yemenshabab/services/home/service/home_service.dart';

part 'program_state.dart';

class ProgramCubit extends Cubit<ProgramState> {
  final HomeService homeService;

  ProgramCubit({required this.homeService}) : super(ProgramInitial());

  Future<void> fetchPrograms() async {
    try {
      emit(ListProgramsLoading());
      final program = await homeService.fetchPrograms();
      programEntity = program;
      emit(ListProgramsLoaded(program));
    } catch (e) {
      emit(const ListProgramsError('Failed to fetch programs'));
    }
  }

  Future<void> getProgram(String uuid) async {
    try {
      emit(ProgramLoading());
      for (var program in programEntity?.programs ?? []) {
        if (uuid == program.uuid) {
          return emit(ProgramLoaded(program));
        }
      }
      final program = await homeService.getProgram(uuid);
      programEntity?.programs?.add(program);
      emit(ProgramLoaded(program));
    } catch (e) {
      emit(ProgramError('Failed to fetch program [$uuid]'));
    }
  }
}
