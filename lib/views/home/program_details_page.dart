import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/cubits/program_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/program/program_entity.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/loading.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/tag.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/program_watch_page.dart';

class ProgramDetailsPage extends StatelessWidget {
  const ProgramDetailsPage({super.key, this.program, required this.uuid});

  final ProgramPrograms? program;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeController.newProgramCubit()..getProgram(uuid),
      child: BlocBuilder<ProgramCubit, ProgramState>(
        builder: (context, state) {
          return BuildCondition(
            condition: state is ProgramLoaded,
            builder: (context) => Scaffold(
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(createRoute(
                    () => ProgramWatchPage(
                      playlist: (state as ProgramLoaded).program.playlistId!,
                      title: isArabic(context)
                          ? (state).program.titleAr!
                          : (state).program.title!,
                    ),
                  ));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                tooltip: AppLocalizations.of(context)!.watch,
                label: Text(
                  AppLocalizations.of(context)!.watch,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      isArabic(context)
                          ? (state as ProgramLoaded).program.titleAr!
                          : (state as ProgramLoaded).program.title!,
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      // title:
                      //     Text(isArabic(context) ? (state as ProgramLoaded).program.titleAr! : (state as ProgramLoaded).program.title!),
                      background: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ImageComponent(
                              imageUrl: (state).program.image!,
                            ),
                          ),
                          Container(
                            height: 310,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    stops: const [
                                      0.0,
                                      0.9
                                    ],
                                    colors: [
                                      Theme.of(context)
                                          .cardColor
                                          .withOpacity(.5),
                                      Theme.of(context)
                                          .cardColor
                                          .withOpacity(.0)
                                    ])),
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height * 0.305,
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      height: 1000,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(height: 15),
                            // if ((state).program.time != null)
                            //   Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 15.0),
                            //     child: Tag(
                            //       tagName: getFormattedTime(
                            //         (state).program.time!,
                            //         locale: Localizations.localeOf(context)
                            //             .toLanguageTag(),
                            //       ),
                            //       color: Theme.of(context).colorScheme.primary,
                            //     ),
                            //   ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                // color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  isArabic(context)
                                      ? (state).program.descriptionAr!
                                      : (state).program.description!,
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                            Divider(
                              color: Theme.of(context).cardColor,
                            ),
                            Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                // color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${AppLocalizations.of(context)!.timeShow}:  ',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          '${AppLocalizations.of(context)!.broadcastsHour}:  ',
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          getFormattedTime(
                                            (state).program.time!,
                                            locale:
                                                Localizations.localeOf(context)
                                                    .toLanguageTag(),
                                          ),
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      '${AppLocalizations.of(context)!.daysShow}:  ',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Wrap(
                                      spacing: 10,
                                      children: List.generate(
                                        (state).program.days!.split(',').length,
                                        (index) => Chip(
                                          side: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          backgroundColor:
                                              Theme.of(context).cardColor,
                                          // label: Text((state as ProgramLoaded).program.days!.split(',')[index]),
                                          label: Text(getDay(
                                              context,
                                              (state)
                                                  .program
                                                  .days!
                                                  .split(',')[index])),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
                ],
              ),
            ),
            fallback: (context) => BuildCondition(
              condition: state is ProgramError,
              builder: (context) => Center(
                child: Text(state.props.toString()),
              ),
              fallback: (context) => const LoadingScreen(),
            ),
          );
        },
      ),
    );
    // Scaffold(
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       Navigator.of(context).push(createRoute(
    //         () => ProgramWatchPage(
    //           playlist: (state as ProgramLoaded).program.playlistId!,
    //           title: isArabic(context) ? (state as ProgramLoaded).program.titleAr! : (state as ProgramLoaded).program.title!,
    //         ),
    //       ));
    //     },
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    //     child: Icon(
    //       Icons.play_arrow_rounded,
    //       size: 30,
    //     ),
    //     tooltip: AppLocalizations.of(context)!.watch,
    //   ),
    //   body: Stack(
    //     children: [
    //       Container(
    //         child: Image.network(
    //           (state as ProgramLoaded).program.image!,
    //           fit: BoxFit.cover,
    //           height: 310,
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 290),
    //         child: Container(
    //           width: double.infinity,
    //           height: double.infinity,
    //           decoration: BoxDecoration(
    //             color: Theme.of(context).scaffoldBackgroundColor,
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(10.0),
    //             child: SingleChildScrollView(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   SizedBox(height: 10),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
    //                     child: Tag(
    //                       tagName: getFormattedTime((state as ProgramLoaded).program.time!),
    //                       color: Theme.of(context).colorScheme.primary,
    //                     ),
    //                   ),
    //                   Container(
    //                     width: double.infinity,
    //                     decoration: BoxDecoration(
    //                       // color: Theme.of(context).scaffoldBackgroundColor,
    //                       borderRadius: BorderRadius.circular(15),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(15.0),
    //                       child: Text(
    //                         isArabic(context)
    //                             ? (state as ProgramLoaded).program.descriptionAr!
    //                             : (state as ProgramLoaded).program.description!,
    //                         style: TextStyle(
    //                           fontSize: 22,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Divider(
    //                     color: Theme.of(context).drawerTheme.backgroundColor,
    //                   ),
    //                   Container(
    //                     width: double.infinity,
    //                     height: 200,
    //                     decoration: BoxDecoration(
    //                       // color: Theme.of(context).cardColor,
    //                       borderRadius: BorderRadius.circular(15),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(15.0),
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             AppLocalizations.of(context)!.daysShow + ':  ',
    //                             style: TextStyle(
    //                               fontSize: 20,
    //                             ),
    //                           ),
    //                           SizedBox(height: 20),
    //                           Wrap(
    //                             spacing: 10,
    //                             children: List.generate(
    //                               (state as ProgramLoaded).program.days!.split(',').length,
    //                               (index) => Chip(
    //                                 // label: Text((state as ProgramLoaded).program.days!.split(',')[index]),
    //                                 label: Text(getDay(context,
    //                                     (state as ProgramLoaded).program.days!.split(',')[index])),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Container(
    //         height: 310,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             gradient: LinearGradient(
    //                 begin: Alignment.topRight,
    //                 stops: const [
    //                   0.0,
    //                   0.9
    //                 ],
    //                 colors: [
    //                   Colors.black.withOpacity(.5),
    //                   Colors.black.withOpacity(.0)
    //                 ])),
    //       ),
    //       AppBar(
    //         backgroundColor: Colors.transparent,
    //         title: Text(isArabic(context) ? (state as ProgramLoaded).program.titleAr! : (state as ProgramLoaded).program.title!),
    //         actions: [
    //           IconButton(
    //             onPressed: () {
    //               Share.share('check out my website https://example.com');
    //             },
    //             icon: Icon(Icons.share_rounded),
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
