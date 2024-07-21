import 'package:flutter/material.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/data.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_model.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/news_details_page.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/video_details_page.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    required this.newsModel,
    super.key,
    this.category,
  });

  final SectionDate? category;
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        if (newsModel.title != null && newsModel.title!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (category != null) {
                  tabController.animateTo(category!.index);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection:
                    isArabic(context) ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  Text(
                    newsModel.title!,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (category != null)
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 30,
                    ),
                ],
              ),
            ),
          ),
        SizedBox(height: 20),
        Container(
          height: 270,
          child: ListView.builder(
            itemCount: newsModel.data!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(context, _createRoute(newsModel.data![index]));
              },
              child: Container(
                margin: const EdgeInsetsDirectional.only(end: 20),
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ImageComponent(
                        imageUrl: newsModel.data![index].image!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        newsModel.data![index].title!,
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
                            newsModel.data![index].time!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
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
        ),
      ],
    );
  }

  Route _createRoute(DataModel dataModel) {
    return createRoute(
      () => dataModel.dataType == 'VIDEO'
          ? VideoDetailsPage(dataModel: dataModel)
          : NewsDetailsPage(dataModel: dataModel),
    );
  }
}
