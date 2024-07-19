import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/program_status.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/program/program_entity.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/banner_basic.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/program_details_page.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key, required this.program});

  final ProgramEntity program;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      semanticChildCount: 20,
      childAspectRatio: 1.5,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(
        program.programs!.length,
        (index) => buildAnimationConfiguration(index, context),
      ),
    );
  }

  AnimationConfiguration buildAnimationConfiguration(
      int index, BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      columnCount: 2,
      duration: const Duration(milliseconds: 750),
      child: ScaleAnimation(
        scale: 0,
        child: FadeInAnimation(
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
            child: BannerBasicPage(
              fontSize: 12,
              title: ProgramStatus.titleOf(context,
                  statusString: program.programs![index].programStatus)!,
              widget: AnimatedContainer(
                height: 500,
                duration: const Duration(milliseconds: 350),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ImageComponent(
                  imageUrl: program.programs![index].image!,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
