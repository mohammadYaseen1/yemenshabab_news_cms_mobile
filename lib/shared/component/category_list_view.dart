import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/data/models/section/section_data_entity.dart';
import 'package:yemenshabab/shared/component/CustomFirstPageErrorIndicator.dart';
import 'package:yemenshabab/shared/component/image_component.dart';
import 'package:yemenshabab/shared/component/loading.dart';
import 'package:yemenshabab/shared/component/no_items_found_indicator.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/shared/utils/utils.dart';
import 'package:yemenshabab/views/home/news_details_page.dart';
import 'package:yemenshabab/views/home/video_details_page.dart';

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
      ViewType.ADS => throw UnimplementedError(),
    };
    return PagedListView<int, SectionDataData>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<SectionDataData>(
          itemBuilder: (context, item, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
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
                                    dataType: ViewType.valueOf(dataType.name),
                                    color: parseColorString(
                                      item.categoryColor!,
                                    ),
                                  ))
                                : NewsDetailsPage(
                                    dataModel: DataModel(
                                    uuid: item.uuid,
                                    dataType: ViewType.valueOf(dataType.name),
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
          noItemsFoundIndicatorBuilder: (context) =>
              const CustomNoItemsFoundIndicator(),
          firstPageProgressIndicatorBuilder: (context) => LoadingScreen(),
          firstPageErrorIndicatorBuilder: (context) =>
              CustomFirstPageErrorIndicator(
                onTryAgain: _pagingController.retryLastFailedRequest,
              ),
          animateTransitions: true),
    );
  }

  Widget buildArticle(SectionDataData item, BuildContext context) {
    return Row(
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
              titleBox(context, item),
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
    );
  }

  Widget buildNews(SectionDataData item, BuildContext context) {
    return Row(
      children: [
        buildImage(item),
        SizedBox(width: 10),
        buildContent(context, item),
      ],
    );
  }

  Widget buildContent(BuildContext context, SectionDataData item) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleBox(context, item),
          SizedBox(height: 10),
          publishedDate(item, context),
        ],
      ),
    );
  }

  Widget buildImage(SectionDataData item) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 150,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ImageComponent(
          imageUrl: item.image!,
          height: 120,
        ),
      ),
    );
  }

  Text publishedDate(SectionDataData item, BuildContext context) {
    return Text(
      getFormattedDate(
          item.creationDate!, Localizations.localeOf(context).toLanguageTag()),
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 18,
      ),
    );
  }

  AutoSizeText titleBox(BuildContext context, SectionDataData item) {
    return AutoSizeText(
      isArabic(context) ? item.titleAr! : item.titleEn!,
      maxFontSize: 20,
      minFontSize: 14,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      maxLines: 5,
    );
  }
}
