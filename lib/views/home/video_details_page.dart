import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/services/home/cubits/news_cubit.dart';
import 'package:yemenshabab/shared/component/image_component.dart';
import 'package:yemenshabab/shared/component/loading.dart';
import 'package:yemenshabab/shared/component/share_button.dart';
import 'package:yemenshabab/shared/component/youtube_player.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/shared/utils/utils.dart';

class VideoDetailsPage extends StatefulWidget {
  VideoDetailsPage({super.key, required this.dataModel});

  final DataModel dataModel;

  @override
  State<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  late Floating floating;

  @override
  void initState() {
    super.initState();
    floating = Floating();
    enable();
  }

  void enable() async {
    await floating.enable(OnLeavePiP());
  }

  void disable() async {
    await floating.cancelOnLeavePiP();
  }

  @override
  void dispose() {
    disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeController.newNewsCubit()
        ..getNews(widget.dataModel.uuid!, widget.dataModel.dataType!),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return state is NewsLoaded
              ? PiPSwitcher(
                  floating: floating,
                  childWhenEnabled: CustomYouTubePlayer(
                      id: convertUrlToId(state.newsEntity.contentAr!)!),
                  childWhenDisabled: Scaffold(
                      appBar: AppBar(
                        actions: [ShareButton(url: "url")],
                      ),
                      body: SingleChildScrollView(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    isArabic(context)
                                        ? state.newsEntity.category!.nameAr!
                                        : state.newsEntity.category!.nameEn!,
                                    style: TextStyle(
                                        color: widget.dataModel.color),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    isArabic(context)
                                        ? state.newsEntity.titleAr!
                                        : state.newsEntity.titleEn!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    getFormattedDate(
                                        state.newsEntity.creationDate!,
                                        Localizations.localeOf(context)
                                            .toLanguageTag()),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color,
                                    ),
                                  ),
                                ),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: CustomYouTubePlayer(
                                      id: convertUrlToId(
                                          state.newsEntity.contentAr!)!),
                                ),
                                SizedBox(height: 25),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SelectionArea(
                                    child: HtmlWidget(
                                      isArabic(context)
                                          ? state.newsEntity.descriptionAr!
                                          : state.newsEntity.descriptionEn!,
                                      renderMode: RenderMode.column,
                                      textStyle: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                if (state.newsEntity.keywords != null) ...[
                                  Text(
                                    AppLocalizations.of(context)!.keywords,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Wrap(
                                    children: (isArabic(context)
                                            ? state.newsEntity.keywords!.ar ??
                                                []
                                            : state.newsEntity.keywords!.en ??
                                                [])
                                        .map(
                                          (e) => Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Chip(
                                              label: Text(e),
                                              side: BorderSide(
                                                  color: Colors.grey, width: 1),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ),
                      )))
              : LoadingScreen();
        },
      ),
    );
  }

  InkWell buildExtraNews(NewsLoaded state, BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(createRoute(() => VideoDetailsPage(
                dataModel: DataModel(
              uuid: state.extraNews!.items!.first.uuid,
              color: parseColorString(state.extraNews!.color!),
              dataType: ViewType.valueOf(state.extraNews!.dataType),
            ))));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        height: 120,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageComponent(
                  imageUrl: state.extraNews!.items!.first.image!,
                )),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isArabic(context)
                        ? state.extraNews!.items!.first.title!
                        : state.extraNews!.items!.first.subtitle!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        isArabic(context)
                            ? state.extraNews!.items!.first.category!
                            : state.extraNews!.items!.first.categoryEn!,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Text(
                        "${AppLocalizations.of(context)!.since} ${getDurationString(state.newsEntity.creationDate!, Localizations.localeOf(context).toLanguageTag())}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
