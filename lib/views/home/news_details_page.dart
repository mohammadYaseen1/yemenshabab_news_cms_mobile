import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/services/home/cubits/news_cubit.dart';
import 'package:yemenshabab/services/home/models/landing/data.dart';
import 'package:yemenshabab/services/home/models/landing/item.dart';
import 'package:yemenshabab/shared/component/CustomFirstPageErrorIndicator.dart';
import 'package:yemenshabab/shared/component/back_component.dart';
import 'package:yemenshabab/shared/component/image_component.dart';
import 'package:yemenshabab/shared/component/loading.dart';
import 'package:yemenshabab/shared/component/share_button.dart';
import 'package:yemenshabab/shared/component/youtube_view.dart';
import 'package:yemenshabab/shared/constants/constants.dart';
import 'package:yemenshabab/shared/extension/string.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/shared/utils/social_media.dart';
import 'package:yemenshabab/shared/utils/utils.dart';
import 'package:yemenshabab/views/home/my_slider.dart';
import 'package:yemenshabab/views/keyword_details_page.dart';
import 'package:yemenshabab/views/reading_mode_page.dart';
import 'package:yemenshabab/views/writer_page.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({super.key, required this.dataModel});

  final DataModel dataModel;

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  late bool isArabicLang;
  late SfRangeValues _values;
  var fontSize = 18.0;

  late Locale lang;

  @override
  void initState() {
    _values = const SfRangeValues(10.0, 24.0);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    isArabicLang = isArabic(context);
    lang = AppLocalizations.supportedLocales[isArabicLang ? 0 : 1];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeController.newNewsCubit()
        ..getNews(widget.dataModel.uuid!, widget.dataModel.dataType!),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackComponent(),
              actions: [
                if (state is NewsLoaded) ...[
                  ShareButton(url: makeSharedUrl(context, state.newsEntity)),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(createRoute(
                          () => ReadingModePage(
                            content: state.newsEntity,
                            isArabicLang: isArabicLang,
                          ),
                        ));
                      },
                      icon: const Icon(
                        FontAwesomeIcons.glasses,
                      ))
                ],
                // if (false)
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Theme.of(context).cardColor,
                        constraints: const BoxConstraints(
                          maxHeight: 300,
                        ),
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: SizedBox(
                              child: ListView(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 15, right: 15),
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .settingContent,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    AppLocalizations.of(context)!.fontSize,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  MySlider(
                                    fontSize: fontSize,
                                    onChanged: (value) {
                                      setState(() {
                                        fontSize = value;
                                        print(fontSize);
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    AppLocalizations.of(context)!.language,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  AnimatedToggleSwitch<Locale>.size(
                                    textDirection: TextDirection.rtl,
                                    current: lang,
                                    values: AppLocalizations.supportedLocales,
                                    indicatorSize: const Size.fromWidth(300),
                                    borderWidth: 4.0,
                                    iconList: [
                                      const Text('العربية'),
                                      const Text('English'),
                                    ],
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      borderColor: Colors.transparent,
                                      indicatorColor: Theme.of(context)
                                          .toggleButtonsTheme
                                          .color,
                                      backgroundColor: Theme.of(context)
                                          .toggleButtonsTheme
                                          .fillColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onChanged: (local) {
                                      setState(() {
                                        lang = local;
                                        isArabicLang =
                                            local.languageCode == 'ar';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.settings)),
              ],
            ),
            body: state is NewsLoaded
                ? SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (state.newsEntity.dataType == ViewType.ARTICLE)
                              Column(
                                children: [
                                  if (state.newsEntity.extras!.writerLinks ==
                                      'true')
                                    buildWriterName(context, state),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: double.infinity,
                                    height: 120,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {},
                                          child: Container(
                                            width: 110,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)
                                                // shape: BoxShape.circle
                                                ),
                                            child: ImageComponent(
                                              imageUrl: state.newsEntity.extras!
                                                  .writerImage!,
                                            ),
                                          ),
                                        ),
                                        if (state.newsEntity.extras!
                                                .writerLinks ==
                                            'false')
                                          const SizedBox(width: 15),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (state.newsEntity.extras!
                                                          .writerLinks ==
                                                      'false')
                                                    buildWriterName(
                                                        context, state),
                                                  Wrap(
                                                    // alignment: WrapAlignment.center,
                                                    children: [
                                                      if ((state.newsEntity.extras!
                                                                  .writerFacebook ??
                                                              '')
                                                          .isNotEmpty)
                                                        buildSocialMediaButton(
                                                            url: state
                                                                .newsEntity
                                                                .extras!
                                                                .writerFacebook!,
                                                            icon: FontAwesomeIcons
                                                                .squareFacebook,
                                                            context: context,
                                                            iconColor: "#1877F2"
                                                                .toColor),
                                                      if ((state.newsEntity.extras!
                                                                  .writerInstagram ??
                                                              '')
                                                          .isNotEmpty)
                                                        buildSocialMediaButton(
                                                            url: state
                                                                .newsEntity
                                                                .extras!
                                                                .writerInstagram!,
                                                            icon:
                                                                FontAwesomeIcons
                                                                    .instagram,
                                                            context: context,
                                                            iconColor: "#C13584"
                                                                .toColor),
                                                      if ((state.newsEntity.extras!
                                                                  .writerTwitter ??
                                                              '')
                                                          .isNotEmpty)
                                                        buildSocialMediaButton(
                                                            url: state
                                                                .newsEntity
                                                                .extras!
                                                                .writerTwitter!,
                                                            icon: FontAwesomeIcons
                                                                .squareXTwitter,
                                                            context: context,
                                                            iconColor: Theme.of(
                                                                    context)
                                                                .iconTheme
                                                                .color),
                                                      if ((state.newsEntity.extras!
                                                                  .writerLinkedin ??
                                                              '')
                                                          .isNotEmpty)
                                                        buildSocialMediaButton(
                                                            url: state
                                                                .newsEntity
                                                                .extras!
                                                                .writerLinkedin!,
                                                            icon:
                                                                FontAwesomeIcons
                                                                    .linkedin,
                                                            context: context,
                                                            iconColor: "#0762C8"
                                                                .toColor),
                                                      if ((state.newsEntity.extras!
                                                                  .writerTelegram ??
                                                              '')
                                                          .isNotEmpty)
                                                        buildSocialMediaButton(
                                                            url: state
                                                                .newsEntity
                                                                .extras!
                                                                .writerTelegram!,
                                                            icon:
                                                                FontAwesomeIcons
                                                                    .telegram,
                                                            context: context,
                                                            iconColor: "#24A1DE"
                                                                .toColor),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SelectableText(
                                isArabicLang
                                    ? state.newsEntity.titleAr!
                                    : state.newsEntity.titleEn!,
                                textDirection: isArabicLang
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Row(
                              textDirection: isArabicLang
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SelectableText(
                                    isArabicLang
                                        ? state.newsEntity.category!.nameAr!
                                        : state.newsEntity.category!.nameEn!,
                                    style: TextStyle(
                                        color: parseColorString(state.newsEntity
                                            .category!.categoryColor!)),
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(50)),
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
                              ],
                            ),
                            if ((state.newsEntity.extras?.source ?? '')
                                .isNotEmpty) ...[
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  (isArabicLang
                                          ? state.newsEntity.extras?.source
                                          : state
                                              .newsEntity.extras?.sourceEn) ??
                                      '',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 20)
                            ],
                            if (state.newsEntity.image != null &&
                                state.newsEntity.image!.isNotEmpty)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      child: ImageComponent(
                                          imageUrl: state.newsEntity.image!,
                                          clickable: true),
                                    ),
                                    if ((state.newsEntity.extras
                                                ?.imageCaption ??
                                            '')
                                        .isNotEmpty)
                                      Container(
                                        width: double.infinity,
                                        color: Theme.of(context)
                                            .cardColor
                                            .withOpacity(0.7),
                                        child: Text(
                                          (isArabicLang
                                                  ? state.newsEntity.extras
                                                      ?.imageCaption
                                                  : state.newsEntity.extras
                                                      ?.imageCaptionEn) ??
                                              '',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            const SizedBox(height: 25),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SelectionArea(
                                selectionControls:
                                    CupertinoTextSelectionControls(),
                                child: HtmlWidget(
                                  customStylesBuilder: (element) {
                                    if (element.outerHtml.contains("<li")) {
                                      return {"padding": "10px"};
                                    }
                                    if (element.outerHtml.contains("<span")) {
                                      return {"line-height": "normal"};
                                    }
                                    return null;
                                  },
                                  customWidgetBuilder: (element) {
                                    if (element.localName == "blockquote" &&
                                        element.classes
                                            .contains("twitter-tweet")) {
                                      print("element-twitter: $element");
                                    }
                                    if (element.localName == "iframe" &&
                                        element.attributes["src"]!
                                            .contains("youtube")) {
                                      var src = element.attributes["src"]!;
                                      print("iframe: $src");
                                      var index = src.lastIndexOf("d/") + 2;
                                      var id = src.substring(index);
                                      print("id: $id");
                                      return YoutubeView(id: id);
                                    }
                                    if (element.localName == "img") {
                                      var src = element.attributes["src"]!;
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: ImageComponent(
                                          imageUrl: src,
                                          clickable: true,
                                        ),
                                      );
                                    }
                                  },
                                  isArabicLang
                                      ? state.newsEntity.contentAr!
                                      : state.newsEntity.contentEn!,
                                  renderMode: RenderMode.column,
                                  onTapUrl: (url) => launchUrl(Uri.parse(url)),
                                  textStyle: TextStyle(fontSize: fontSize),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            if (state.newsEntity.keywords != null)
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.keywords,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Wrap(
                                        textDirection: isArabicLang
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                        children: (isArabicLang
                                                ? state.newsEntity.keywords!
                                                        .ar ??
                                                    []
                                                : state.newsEntity.keywords!
                                                        .en ??
                                                    [])
                                            .map(
                                              (e) => Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .push(createRoute(
                                                      () => KeywordDetailsPage(
                                                          dataType: widget
                                                              .dataModel
                                                              .dataType!,
                                                          keyword: e),
                                                    ));
                                                  },
                                                  child: Chip(
                                                    label: Text(e),
                                                    side: const BorderSide(
                                                        color: Colors.grey,
                                                        width: 1),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            const SizedBox(height: 25),
                            if (state.extraNews != null &&
                                state.extraNews!.items != null &&
                                state.extraNews!.items!.isNotEmpty)
                              buildExtraNews(state.extraNews!, context),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  )
                : state is NewsError
                    ? CustomFirstPageErrorIndicator(
                        onTryAgain: () => homeController.newsCubit.getNews(
                            widget.dataModel.uuid!, widget.dataModel.dataType!),
                      )
                    : const LoadingScreen(),
          );
        },
      ),
    );
  }

  InkWell buildWriterName(BuildContext context, NewsLoaded state) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(createRoute(
          () => WriterPage(uuid: state.newsEntity.extras!.writerId!),
        ));
      },
      child: Text(
        isArabicLang
            ? state.newsEntity.extras!.writerName!
            : state.newsEntity.extras!.writerNameEn!,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  Widget buildExtraNews(Data extraNews, BuildContext context) {
    List<Item> items = extraNews.items!
        .skipWhile(
          (value) => value.uuid == widget.dataModel.uuid!,
        )
        .toList();
    if (items.isEmpty) return const SizedBox();
    return Column(
      children: [
        Divider(
          color: Theme.of(context).cardColor,
        ),
        const SizedBox(height: 10),
        Text(
          AppLocalizations.of(context)!.relatedNews,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(
          items.length,
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
                    uuid: items[index].uuid,
                    dataType: ViewType.valueOf(extraNews.dataType),
                    color: parseColorString(items[index].categoryColor!),
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
                child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxHeight: 100),
                      width: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ImageComponent(imageUrl: items[index].image!),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                isArabic(context)
                                    ? items[index].category!
                                    : items[index].categoryEn!,
                                style: TextStyle(
                                    color: parseColorString(
                                        items[index].categoryColor!)),
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
                              AutoSizeText(
                                getFormattedDate(items[index].date!),
                                maxLines: 2,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            isArabic(context)
                                ? items[index].title!
                                : items[index].subtitle!,
                            style: const TextStyle(
                              // fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  InkWell buildExtraNews1(NewsLoaded state, BuildContext context) {
    var items = state.extraNews!.items!;
    var item = (items..shuffle()).first;
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(createRoute(() {
          return NewsDetailsPage(
              dataModel: DataModel(
            uuid: item.uuid,
            color: parseColorString(state.extraNews!.color!),
            dataType: ViewType.valueOf(state.extraNews!.dataType),
          ));
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
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
                child: Image.network(
                  items.first.image!,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isArabicLang ? item.title! : item.subtitle!,
                    style: const TextStyle(
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
                        isArabicLang ? item.category! : item.categoryEn!,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Text(
                        getFormattedDate(state.newsEntity.creationDate!,
                            Localizations.localeOf(context).toLanguageTag()),
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
