import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/program_schedule_entity.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/banner_basic.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/days.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/program_details_page.dart';

class ProgramTabScreen extends StatelessWidget {
  const ProgramTabScreen({Key? key, required this.programs, required this.day})
      : super(key: key);

  final Days day;

  final List<ProgramSchedulePrograms> programs;

  @override
  Widget build(BuildContext context) {
    return BuildCondition(
      condition: programs.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildProgramCard(context, index),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        padding: const EdgeInsets.only(top: 15, bottom: 100, left: 5, right: 5),
        itemCount: programs.length,
      ),
      fallback: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu_rounded,
            size: 150,
            color: Colors.grey.withOpacity(0.3),
          ),
          Text(
            AppLocalizations.of(context)!.noPrograms,
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProgramCard(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(createRoute(
          () => ProgramDetailsPage(uuid: programs[index].programUuid!),
        ));
      },
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: isActiveDate(
        date: programs[index].showTime!,
        duration:
            Duration(minutes: int.parse(programs[index].showDuration ?? "60")),
        day: day,
      )
          ? BannerBasicPage(
              title: AppLocalizations.of(context)!.nowShowing,
              widget: buildProgram(context, index),
            )
          : buildProgram(context, index),
    );
  }

  Container buildProgram(BuildContext context, int index) {
    return Container(
      height: 305,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        border: BorderDirectional(
          bottom: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 3),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ImageComponent(
                imageUrl: programs[index].programImage!,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      isArabic(context)
                          ? programs[index].titleAr!
                          : programs[index].title!,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      getFormattedTime(programs[index].showTime!,
                          locale:
                              Localizations.localeOf(context).toLanguageTag()),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
