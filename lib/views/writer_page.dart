import 'package:auto_size_text/auto_size_text.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/data/models/writer_entity.dart';
import 'package:yemenshabab/services/home/cubits/writer_cubit.dart';
import 'package:yemenshabab/shared/component/loading.dart';
import 'package:yemenshabab/shared/constants/constants.dart';
import 'package:yemenshabab/shared/extension/string.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/shared/utils/social_media.dart';
import 'package:yemenshabab/shared/utils/utils.dart';
import 'package:yemenshabab/views/home/news_details_page.dart';

class WriterPage extends StatelessWidget {
  const WriterPage({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeController.newWriterCubit()..fetchWriters(uuid),
      child: BlocBuilder<WriterCubit, WriterState>(
        builder: (context, state) {
          return Scaffold(
            body: BuildCondition(
              condition: state is ListWritersLoaded,
              builder: (context) {
                return buildInformation(
                    context, (state as ListWritersLoaded).writer);
              },
              fallback: (context) => BuildCondition(
                condition: state is ListWritersError,
                builder: (context) => Center(
                  child: Text(state.props.toString()),
                ),
                fallback: (context) => const LoadingScreen(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildInformation(BuildContext context, WriterEntity writer) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        buildWriterInfo(context, writer),
        buildArticles(writer, context),
      ],
    );
  }

  SliverList buildArticles(WriterEntity writer, BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      if ((writer.writer?.showLinks ?? false) &&
          ((writer.writer!.instagram ?? '').isNotEmpty ||
              (writer.writer!.facebook ?? '').isNotEmpty ||
              (writer.writer!.telegram ?? '').isNotEmpty ||
              (writer.writer!.linkedin ?? '').isNotEmpty ||
              (writer.writer!.twitter ?? '').isNotEmpty))
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
                    if ((writer.writer!.facebook ?? '').isNotEmpty)
                      buildSocialMediaButton(
                          url: writer.writer!.facebook!,
                          icon: FontAwesomeIcons.squareFacebook,
                          context: context,
                          iconColor: "#1877F2".toColor),
                    if ((writer.writer!.instagram ?? '').isNotEmpty)
                      buildSocialMediaButton(
                          url: writer.writer!.instagram!,
                          icon: FontAwesomeIcons.instagram,
                          context: context,
                          iconColor: "#C13584".toColor),
                    if ((writer.writer!.twitter ?? '').isNotEmpty)
                      buildSocialMediaButton(
                          url: writer.writer!.twitter!,
                          icon: FontAwesomeIcons.squareXTwitter,
                          context: context,
                          iconColor: Theme.of(context).iconTheme.color),
                    if ((writer.writer!.linkedin ?? '').isNotEmpty)
                      buildSocialMediaButton(
                          url: writer.writer!.linkedin!,
                          icon: FontAwesomeIcons.linkedin,
                          context: context,
                          iconColor: "#0762C8".toColor),
                    if ((writer.writer!.telegram ?? '').isNotEmpty)
                      buildSocialMediaButton(
                          url: writer.writer!.telegram!,
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
        padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            ...List.generate(
              writer.articles?.resources?.length ?? 0,
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
                        uuid: writer.articles!.resources![index].uuid,
                        dataType: ViewType.ARTICLE,
                        color: parseColorString(
                            writer.articles!.resources![index].categoryColor!),
                      )),
                    ));
                  },
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              isArabic(context)
                                  ? writer
                                      .articles!.resources![index].categoryAr!
                                  : writer
                                      .articles!.resources![index].category!,
                              style: TextStyle(
                                  color: parseColorString(writer.articles!
                                      .resources![index].categoryColor!)),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 2,
                              height: 13,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              getFormattedDate(writer
                                  .articles!.resources![index].creationDate!),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          isArabic(context)
                              ? writer.articles!.resources![index].titleAr!
                              : writer.articles!.resources![index].titleEn!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        AutoSizeText(
                          isArabic(context)
                              ? writer
                                  .articles!.resources![index].descriptionAr!
                              : writer
                                  .articles!.resources![index].descriptionEn!,
                          maxLines: 4,
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ]));
  }

  SliverAppBar buildWriterInfo(BuildContext context, WriterEntity writer) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        title: Text(
          isArabic(context)
              ? '${writer.writer!.firstName!} ${writer.writer!.lastName!}'
              : '${writer.writer!.firstNameEn!} ${writer.writer!.lastNameEn!}',
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
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    writer.writer!.image!,
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
    );
  }
}
