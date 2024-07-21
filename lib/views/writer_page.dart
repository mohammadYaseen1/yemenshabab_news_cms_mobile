import 'package:auto_size_text/auto_size_text.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/data.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/cubits/writer_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/loading.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/extension/string.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/social_media.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/news_details_page.dart';

class WriterPage extends StatelessWidget {
  const WriterPage({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeController.newWriterCubit()
        ..fetchWriters(uuid),
      child: BlocBuilder<WriterCubit, WriterState>(
        builder: (context, state) {
          return Scaffold(
            body: BuildCondition(
              condition: state is ListWritersLoaded,
              builder: (context) {
                return buildCustomScrollView2(context, state);
              },
              fallback: (context) => BuildCondition(
                condition: state is ListWritersError,
                builder: (context) => Center(
                  child: Text(state.props.toString()),
                ),
                fallback: (context) => LoadingScreen(),
              ),
            ),
          );
        },
      ),
    );
  }

  CustomScrollView buildCustomScrollView(
      BuildContext context, WriterState state) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1.3,
            title: Text(
              isArabic(context)
                  ? '${(state as ListWritersLoaded).writer.writer!.firstName!} ${(state).writer.writer!.lastName!}'
                  : '${(state as ListWritersLoaded).writer.writer!.firstNameEn!} ${(state).writer.writer!.lastNameEn!}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            centerTitle: true,
            background: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ImageComponent(
                        imageUrl: (state).writer.writer!.image!,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: const [
                                0.1,
                                0.6,
                              ],
                              colors: [
                                Colors.white.withOpacity(.9),
                                Colors.white.withOpacity(0)
                              ]),
                        ),
                      ),
                    ],
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
                            Theme.of(context).cardColor.withOpacity(.5),
                            Theme.of(context).cardColor.withOpacity(.0)
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
                            ? (state).writer.writer!.email!
                            : (state).writer.writer!.email!,
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
                                  (state).writer.writer!.creationDate!,
                                  locale: Localizations.localeOf(context)
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
    );
  }

  Widget buildCustomScrollView2(BuildContext context, WriterState state) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1,
            title: Text(
              isArabic(context)
                  ? '${(state as ListWritersLoaded).writer.writer!.firstName!} ${(state).writer.writer!.lastName!}'
                  : '${(state as ListWritersLoaded).writer.writer!.firstNameEn!} ${(state).writer.writer!.lastNameEn!}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            centerTitle: true,
            background: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        (state).writer.writer!.image!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.305,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          if ((state.writer.writer?.showLinks ?? false) &&
              ((state.writer.writer!.instagram ?? '').isNotEmpty ||
                  (state.writer.writer!.facebook ?? '').isNotEmpty ||
                  (state.writer.writer!.telegram ?? '').isNotEmpty ||
                  (state.writer.writer!.linkedin ?? '').isNotEmpty ||
                  (state.writer.writer!.twitter ?? '').isNotEmpty))
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        if ((state.writer.writer!.facebook ?? '').isNotEmpty)
                          buildSocialMediaButton(
                              url: state.writer.writer!.facebook!,
                              icon: FontAwesomeIcons.squareFacebook,
                              context: context,
                              iconColor: "#1877F2".toColor),
                        if ((state.writer.writer!.instagram ?? '').isNotEmpty)
                          buildSocialMediaButton(
                              url: state.writer.writer!.instagram!,
                              icon: FontAwesomeIcons.instagram,
                              context: context,
                              iconColor: "#C13584".toColor),
                        if ((state.writer.writer!.twitter ?? '').isNotEmpty)
                          buildSocialMediaButton(
                              url: state.writer.writer!.twitter!,
                              icon: FontAwesomeIcons.squareXTwitter,
                              context: context,
                              iconColor: Theme.of(context).iconTheme.color),
                        if ((state.writer.writer!.linkedin ?? '').isNotEmpty)
                          buildSocialMediaButton(
                              url: state.writer.writer!.linkedin!,
                              icon: FontAwesomeIcons.linkedin,
                              context: context,
                              iconColor: "#0762C8".toColor),
                        if ((state.writer.writer!.telegram ?? '').isNotEmpty)
                          buildSocialMediaButton(
                              url: state.writer.writer!.telegram!,
                              icon: FontAwesomeIcons.telegram,
                              context: context,
                              iconColor: "#24A1DE".toColor),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            child: Container(
              height: (state.writer.articles?.resources?.length ?? 0) * 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    ...List.generate(
                      state.writer.articles?.resources?.length ?? 0,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.of(context).push(createRoute(
                              () => NewsDetailsPage(
                                  dataModel: DataModel(
                                uuid: state
                                    .writer.articles!.resources![index].uuid,
                                dataType: "ARTICLE",
                                color: parseColorString(state.writer.articles!
                                    .resources![index].categoryColor!),
                              )),
                            ));
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: double.infinity,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      isArabic(context)
                                          ? state.writer.articles!
                                              .resources![index].categoryAr!
                                          : state.writer.articles!
                                              .resources![index].category!,
                                      style: TextStyle(
                                          color: parseColorString(state
                                              .writer
                                              .articles!
                                              .resources![index]
                                              .categoryColor!)),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 2,
                                      height: 13,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      getFormattedDate(state.writer.articles!
                                          .resources![index].creationDate!),
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  isArabic(context)
                                      ? state.writer.articles!.resources![index]
                                          .titleAr!
                                      : state.writer.articles!.resources![index]
                                          .titleEn!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15),
                                AutoSizeText(
                                  isArabic(context)
                                      ? state.writer.articles!.resources![index]
                                          .descriptionAr!
                                      : state.writer.articles!.resources![index]
                                              .descriptionEn! +
                                          "gdfnklfjediokgjfdnbkgvjnnnnnnnnnnnn",
                                  maxLines: 4,
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ])),
      ],
    );
  }
}
