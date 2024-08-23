import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/services/home/cubits/program_schedule_cubit.dart';
import 'package:yemenshabab/shared/component/CustomFirstPageErrorIndicator.dart';
import 'package:yemenshabab/shared/component/custom_app_bar.dart';
import 'package:yemenshabab/shared/component/dynamic_tabbar.dart';
import 'package:yemenshabab/shared/component/loading.dart';
import 'package:yemenshabab/shared/days.dart';
import 'package:yemenshabab/views/home/program_tab_screen.dart';

class ProgramSchedulePage extends StatelessWidget {
  const ProgramSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          homeController.newProgramScheduleCubit()..fetchProgramsSchedule(),
      child: BlocBuilder<ProgramScheduleCubit, ProgramScheduleState>(
        builder: (context, state) {
          return BuildCondition(
            condition: state is ProgramsScheduleLoaded,
            builder: (context) => CustomAppBar(
              static: true,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DynamicTabBarWidget(
                  tabAlignment: TabAlignment.center,
                  dynamicTabs: [
                    ...List.generate(
                      Days.values.length,
                      (index) {
                        return TabData(
                          index: index,
                          title: Tab(
                            text: getDay(context, Days.values[index].name),
                          ),
                          content: ProgramTabScreen(
                              programs: (state as ProgramsScheduleLoaded)
                                      .program
                                      .data[Days.values[index]] ??
                                  [],
                              day: Days.values[index]),
                        );
                      },
                    )
                  ],
                  padding: const EdgeInsets.all(0),
                  viewportFractionTabBarView: 1,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w900),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.w500),
                  unselectedLabelColor: Colors.grey,
                  dividerColor: Theme.of(context).cardColor,
                  isScrollable: true,
                  onTabControllerUpdated: (controller) {
                    debugPrint("onTabControllerUpdated");
                  },
                  onTabChanged: (index) {
                    debugPrint("Tab changed: $index");
                  },
                  showBackIcon: false,
                  showNextIcon: false,
                  indicatorColor: Colors.red,
                  automaticIndicatorColorAdjustment: true,
                  initialIndex:
                      Days.getIndex(dayOfWeek: DateTime.now().weekday),
                ),
              ),
            ),
            fallback: (context) => BuildCondition(
              condition: state is ProgramsScheduleError,
              builder: (context) => const Column(
                children: [
                  SizedBox(height: 150),
                  Expanded(
                    child: Center(
                      child: CustomFirstPageErrorIndicator(),
                    ),
                  ),
                ],
              ),
              fallback: (context) => const LoadingScreen(),
            ),
          );
        },
      ),
    );
  }
}
