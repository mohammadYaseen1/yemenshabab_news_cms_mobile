import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/program_status.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/program/program_entity.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/CustomHoverAnimatedContainer.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/custom_app_bar.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/program_details_page.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key, required this.program});

  final ProgramEntity program;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      body: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        semanticChildCount: 20,
        childAspectRatio: 1.5,
        padding: EdgeInsets.only(top: 20, bottom: 100, right: 10, left: 10),
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        children: List.generate(
          program.programs!.length,
          (index) => buildAnimationConfiguration(index, context),
        ),
      ),
    );
  }

  Widget buildAnimationConfiguration(int index, BuildContext context) {
    ProgramStatus status =
        ProgramStatus.valueOf(program.programs![index].programStatus!);
    return AnimationConfiguration.staggeredGrid(
      position: index,
      columnCount: 2,
      duration: const Duration(milliseconds: 750),
      child: ScaleAnimation(
        scale: 0,
        child: FadeInAnimation(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                    context,
                    createRoute(() => ProgramDetailsPage(
                        program: program.programs![index],
                        uuid: program.programs![index].uuid!)));
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ImageComponent(
                    imageUrl: program.programs![index].image!,
                  ),
                  CustomHoverAnimatedContainer(
                    hoverColor: Colors.black54,
                    hoverHeight: 80,
                    color: Colors.black38,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: status.color,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // height: 40,
                          width: 4,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  isArabic(context)
                                      ? program.programs![index].titleAr!
                                      : program.programs![index].title!,
                                  maxLines: 1,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              AutoSizeText(getFormattedTime(
                                  program.programs![index].time!,
                                  locale: Localizations.localeOf(context)
                                      .toLanguageTag())),
                            ],
                          ),
                        ),
                      ],
                    ),
                    hoverChild: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: status.color,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // height: 40,
                          width: 4,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      isArabic(context)
                                          ? program.programs![index].titleAr!
                                          : program.programs![index].title!,
                                      maxLines: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 5),
                                    AutoSizeText(
                                      ProgramStatus.titleOf(context,
                                          status: status)!,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.grey.shade400),
                                    )
                                  ],
                                ),
                              ),
                              AutoSizeText(getFormattedTime(
                                  program.programs![index].time!,
                                  locale: Localizations.localeOf(context)
                                      .toLanguageTag())),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // child: BannerBasicPage(
              //   fontSize: 12,
              //   title: ProgramStatus.titleOf(context,
              //       status: status)!,
              //   color: status.color,
              //   widget: AnimatedContainer(
              //     height: 500,
              //     duration: const Duration(milliseconds: 350),
              //     clipBehavior: Clip.antiAlias,
              //     decoration: BoxDecoration(
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(10),
              //       ),
              //     ),
              //     child: Stack(
              //       alignment: Alignment.bottomCenter,
              //       children: [
              //         ImageComponent(
              //           imageUrl: program.programs![index].image!,
              //         ),
              //         Container(
              //           color: Colors.black26,
              //           height: 50,
              //           padding: EdgeInsets.all(10),
              //           child: Row(
              //             children: [
              //               Container(
              //                 decoration: BoxDecoration(
              //                   color:status.color,
              //                   borderRadius: BorderRadius.circular(50),
              //                 ),
              //                 height: 40,
              //                 width: 4,
              //               ),
              //               SizedBox(width: 10),
              //               Expanded(
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Expanded(
              //                       child: AutoSizeText( program.programs![index].titleAr!,
              //                         maxLines: 1,
              //                         style: TextStyle(
              //                         color: Colors.white
              //                       ),),
              //                     ),
              //                     Text(getFormattedTime(program.programs![index].time!)),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
