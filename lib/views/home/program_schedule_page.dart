import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/cubits/program_schedule_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/custom_app_bar.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/dynamic_tabbar.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/loading.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/days.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/program_tab_screen.dart';

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
                  padding: EdgeInsets.all(0),
                  viewportFractionTabBarView: 1,
                  labelStyle: TextStyle(fontWeight: FontWeight.w900),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
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
              builder: (context) => Center(
                child: Text(state.props.toString()),
              ),
              fallback: (context) => LoadingScreen(),
            ),
          );
        },
      ),
    );
  }
}
