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

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required PagingController<int, SectionDataData> pagingController,
    required this.dataType,
  }) : _pagingController = pagingController;

  final ViewType dataType;
  final PagingController<int, SectionDataData> _pagingController;

  @override
  Widget build(BuildContext context) {
    Widget Function(SectionDataData) widgetFunc = switch (dataType) {
      ViewType.NEWS => (SectionDataData item) => buildNews(item, context),
      ViewType.ARTICLE => (SectionDataData item) => buildArticle(item, context),
      ViewType.STORY => throw UnimplementedError(),
      ViewType.VIDEO => (SectionDataData item) => buildNews(item, context),
      ViewType.PROGRAM => (SectionDataData item) => buildNews(item, context),
    };
    return PagedListView<int, SectionDataData>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<SectionDataData>(
        itemBuilder: (context, item, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
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
                    ));
              },
              child: widgetFunc(item),
            ),
          ),
        ),
        animateTransitions: true
      ),

    );
  }

  Widget buildArticle(SectionDataData item, BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: ImageComponent(
              imageUrl: item.writerImage!,
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 20),
                Text(
                  isArabic(context) ? item.titleAr! : item.titleEn!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Text(
                  item.writerName!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVideo(SectionDataData item, BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ImageComponent(imageUrl:
            item.image!,

          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isArabic(context) ? item.titleAr! : item.titleEn!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Text(
                getFormattedDate(item.creationDate!,
                    Localizations.localeOf(context).toLanguageTag()),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildProgram(SectionDataData item, BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ImageComponent(imageUrl:
            item.image!,

          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isArabic(context) ? item.titleAr! : item.titleEn!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Text(
                getFormattedDate(item.creationDate!,
                    Localizations.localeOf(context).toLanguageTag()),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNews(SectionDataData item, BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ImageComponent(imageUrl:
            item.image!,

          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isArabic(context) ? item.titleAr! : item.titleEn!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Text(
                getFormattedDate(item.creationDate!,
                    Localizations.localeOf(context).toLanguageTag()),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
