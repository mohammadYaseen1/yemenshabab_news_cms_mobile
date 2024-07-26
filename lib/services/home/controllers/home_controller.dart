import 'package:yemenshabab/services/category_cubit.dart';
import 'package:yemenshabab/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab/services/home/cubits/news_cubit.dart';
import 'package:yemenshabab/services/home/cubits/playlist_cubit.dart';
import 'package:yemenshabab/services/home/cubits/program_cubit.dart';
import 'package:yemenshabab/services/home/cubits/program_schedule_cubit.dart';
import 'package:yemenshabab/services/home/cubits/writer_cubit.dart';
import 'package:yemenshabab/services/home/repositories/home_repository.dart';
import 'package:yemenshabab/services/home/service/home_service.dart';

class HomeController {
  final HomeCubit homeCubit;
  NewsCubit newsCubit;
  ProgramCubit programCubit;
  ProgramScheduleCubit programScheduleCubit;
  PlaylistCubit playlistCubit;
  CategoryCubit categoryCubit;
  WriterCubit writerCubit;

  HomeController()
      : homeCubit = HomeCubit(
          homeService: HomeService(homeRepository: HomeRepository()),
        ),
        newsCubit = NewsCubit(
          homeService: HomeService(homeRepository: HomeRepository()),
        ),
        writerCubit = WriterCubit(
          homeService: HomeService(homeRepository: HomeRepository()),
        ),
        categoryCubit = CategoryCubit(),
        programCubit = ProgramCubit(
          homeService: HomeService(homeRepository: HomeRepository()),
        ),
        playlistCubit = PlaylistCubit(
          homeService: HomeService(homeRepository: HomeRepository()),
        ),
        programScheduleCubit = ProgramScheduleCubit(
          homeService: HomeService(homeRepository: HomeRepository()),
        );

  NewsCubit newNewsCubit() {
    newsCubit = NewsCubit(
      homeService: HomeService(homeRepository: HomeRepository()),
    );
    return newsCubit;
  }

  CategoryCubit newCategoryCubit() {
    categoryCubit = CategoryCubit();
    return categoryCubit;
  }

  PlaylistCubit newPlaylistCubit() {
    playlistCubit = PlaylistCubit(
      homeService: HomeService(homeRepository: HomeRepository()),
    );
    return playlistCubit;
  }

  ProgramCubit newProgramCubit() {
    programCubit = ProgramCubit(
      homeService: HomeService(homeRepository: HomeRepository()),
    );
    return programCubit;
  }

  WriterCubit newWriterCubit() {
    writerCubit = WriterCubit(
      homeService: HomeService(homeRepository: HomeRepository()),
    );
    return writerCubit;
  }

  ProgramScheduleCubit newProgramScheduleCubit() {
    programScheduleCubit = ProgramScheduleCubit(
      homeService: HomeService(homeRepository: HomeRepository()),
    );
    return programScheduleCubit;
  }

  void fetchLanding(String language) {
    homeCubit.fetchAll(language);
  }

  void fetchSections() {
    homeCubit.fetchSections();
  }

  void fetchProgram() {
    homeCubit.fetchPrograms();
  }

  void fetchProgramsSchedule() {
    programScheduleCubit.fetchProgramsSchedule();
  }

  void getProgram(String uuid) {
    programCubit.getProgram(uuid);
  }

  void fetchCategoryData({
    required String dataType,
    required String category,
    int rows = 10,
    int first = 0,
    bool refresh = false,
  }) {
    homeCubit.fetchCategoryData(
        dataType: dataType,
        category: category,
        rows: rows,
        first: first,
        refresh: refresh);
  }

  void select(index) {
    homeCubit.select(index);
  }
}
