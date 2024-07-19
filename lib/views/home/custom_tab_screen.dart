import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/home_model.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_type.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/article_view.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/custom_grid_view.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/indicator.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/program_view.dart';
import 'package:yemenshabab_news_cms_mobile/shared/config/config.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/social_media.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';

class CustomTabScreen extends StatelessWidget {
  CustomTabScreen({
    Key? key,
    required this.homeModel,
    this.category,
  }) : super(key: key);

  final HomeModel homeModel;
  final List<SectionDate>? category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            if (homeModel.indicator.isNotEmpty)
              Indicator(indicators: homeModel.indicator),
            ...List.generate(
              homeModel.news.length,
              (index) => switch (homeModel.news[index].type!) {
                ViewType.NEWS => CustomGridView(
                    newsModel: homeModel.news[index],
                    category: getCategory(context, index),
                  ),
                ViewType.ARTICLE => ArticleView(
                    newsModel: homeModel.news[index],
                    category: getCategory(context, index),
                  ),
                ViewType.VIDEO => CustomGridView(
                    newsModel: homeModel.news[index],
                    category: getCategory(context, index),
                  ),
                ViewType.PROGRAM =>
                  ProgramView(newsModel: homeModel.news[index]),
                ViewType.STORY => CustomGridView(
                    newsModel: homeModel.news[index],
                    category: getCategory(context, index),
                  ),
              },
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection:
                    isArabic(context) ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  Text(
                    AppLocalizations.of(context)!.followUs,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (Config.settings!.facebook != null)
                  buildSocialMediaButton(
                    icon: FontAwesomeIcons.squareFacebook,
                    url: Config.settings!.facebook!,
                    context: context,
                  ),
                if (Config.settings!.instagram != null)
                  buildSocialMediaButton(
                    icon: FontAwesomeIcons.instagram,
                    url: Config.settings!.instagram!,
                    context: context,
                  ),
                if (Config.settings!.twitter != null)
                  buildSocialMediaButton(
                    icon: FontAwesomeIcons.xTwitter,
                    url: Config.settings!.twitter!,
                    context: context,
                  ),
                if (Config.settings!.telegram != null)
                  buildSocialMediaButton(
                    icon: FontAwesomeIcons.telegram,
                    url: Config.settings!.telegram!,
                    context: context,
                  ),
                if (Config.settings!.youtube != null)
                  buildSocialMediaButton(
                    icon: FontAwesomeIcons.youtube,
                    url: Config.settings!.youtube!,
                    context: context,
                  ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  SectionDate? getCategory(BuildContext context, int index) {
    for (var value in category!
        .where(
          (element) => element.section.categories!.length < 2,
        )
        .toList()) {
      if (isClickable(value.section.nameEn, index)) {
        return value;
      }
    }
    return null;
  }

  bool isClickable(String? sectionName, int index) {
    return sectionName == homeModel.news[index].name!;
  }
}
