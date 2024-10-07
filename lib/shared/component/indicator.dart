import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yemenshabab/data/models/home/indicator/Indicator_model.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/shared/component/image_component.dart';
import 'package:yemenshabab/shared/component/tag.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/views/home/news_details_page.dart';

class Indicator extends StatelessWidget {
  Indicator({
    super.key,
    required this.indicators,
  });

  final controller = PageController();
  final List<IndicatorModel> indicators;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = buildPages(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: PageView.builder(
            controller: controller,
            itemCount: pages.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SmoothPageIndicator(
            controller: controller,
            count: pages.length,
            effect: const SlideEffect(
                dotHeight: 3,
                dotWidth: 40,
                activeDotColor: Colors.white,
                dotColor: Colors.white24,
                radius: 20,
                type: SlideType.slideUnder),
          ),
        ),
      ],
    );
  }

  List<Widget> buildPages(BuildContext context) => List.generate(
        indicators.length,
        (index) => InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.push(
                context,
                createRoute(
                  () => NewsDetailsPage(
                      dataModel: DataModel(
                    uuid: indicators[index].uuid,
                    dataType: ViewType.valueOf(indicators[index].dataType),
                    color: indicators[index].color,
                  )),
                ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.expand,
              children: [
                SizedBox(
                  height: double.infinity,
                  child: ImageComponent(
                    imageUrl: indicators[index].image!,
                  ),
                ),
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: const [
                            0.0,
                            0.9
                          ],
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.5)
                          ])),
                ),
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Tag(
                        tagName: indicators[index].tag!,
                        color: indicators[index].color!,
                        opacity: 0.5,
                        tagColor: Colors.white,
                      ),
                      Text(
                        indicators[index].title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${AppLocalizations.of(context)!.since} ${indicators[index].time!}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
