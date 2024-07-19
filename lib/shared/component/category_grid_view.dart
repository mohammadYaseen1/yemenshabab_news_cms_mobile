import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/data.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_type.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/section/section_data_entity.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/news_details_page.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/video_details_page.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
    required PagingController<int, SectionDataData> pagingController,
    required this.dataType,
  }) : _pagingController = pagingController;

  final ViewType dataType;
  final PagingController<int, SectionDataData> _pagingController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget Function(SectionDataData) widgetFunc = switch (dataType) {
      ViewType.NEWS => (SectionDataData item) => buildNews(item, context),
      ViewType.ARTICLE => (SectionDataData item) => buildArticle(item, context),
      ViewType.STORY => throw UnimplementedError(),
      ViewType.VIDEO => (SectionDataData item) => buildVideos(item, context),
      ViewType.PROGRAM => (SectionDataData item) => buildNews(item, context),
    };
    return PagedGridView<int, SectionDataData>(
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      pagingController: _pagingController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 100 / getRatio(width),
        crossAxisSpacing: 8,
        mainAxisSpacing: 0,
        crossAxisCount: crossAxisCount(width),
      ),
      builderDelegate: PagedChildBuilderDelegate<SectionDataData>(
        itemBuilder: (context, item, index) => Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(
                    () => dataType == ViewType.VIDEO
                        ? VideoDetailsPage(
                            dataModel: DataModel(
                            uuid: item.uuid,
                            dataType: dataType.name,
                            color: parseColorString(
                              item.categoryColor!,
                            ),
                          ))
                        : NewsDetailsPage(
                            dataModel: DataModel(
                            uuid: item.uuid,
                            dataType: dataType.name,
                            color: parseColorString(
                              item.categoryColor!,
                            ),
                          )),
                  ),
                );
              },
              child: widgetFunc(item),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNews(SectionDataData item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        child: Column(
          children: [
            Container(
              height: 150,
              width: 250,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              child: ImageComponent(
                imageUrl: item.image!,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      isArabic(context) ? item.titleAr! : item.titleEn!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      textDirection: isArabic(context)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          getFormattedDate(item.creationDate!,
                              Localizations.localeOf(context).toLanguageTag()),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVideos(SectionDataData item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        child: Column(
          children: [
            Container(
              height: 150,
              width: 250,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              child: ImageComponent(
                imageUrl: item.image!,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      isArabic(context) ? item.titleAr! : item.titleEn!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      textDirection: isArabic(context)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          getFormattedDate(item.creationDate!,
                              Localizations.localeOf(context).toLanguageTag()),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArticle(SectionDataData item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ImageComponent(
                    imageUrl: item.writerImage!,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    isArabic(context) ? item.writerName! : item.writerName!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      isArabic(context) ? item.titleAr! : item.titleEn!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      textDirection: isArabic(context)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          getFormattedDate(item.creationDate!,
                              Localizations.localeOf(context).toLanguageTag()),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int crossAxisCount(double width) {
    return width >= 1500
        ? 6
        : width >= 1300
            ? 5
            : width >= 1000
                ? 4
                : width >= 725
                    ? 3
                    : 2;
  }

  int getRatio(double width) => width >= 1750
      ? 110
      : width >= 1600
          ? 120
          : width >= 1500
              ? 130
              : width >= 1400
                  ? 120
                  : width >= 1300
                      ? 130
                      : width >= 1200
                          ? 120
                          : width >= 1000
                              ? 130
                              : width >= 900
                                  ? 110
                                  : width >= 850
                                      ? 120
                                      : width >= 725
                                          ? 135
                                          : width >= 700
                                              ? 100
                                              : width >= 600
                                                  ? 115
                                                  : 170;
}
