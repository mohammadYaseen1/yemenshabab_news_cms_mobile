import 'package:flutter/material.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_model.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/news_details_page.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({
    required this.newsModel,
    super.key,
    this.category,
  });

  final NewsModel newsModel;
  final SectionDate? category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
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
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: newsModel.data!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                    context,
                    createRoute(
                      () => NewsDetailsPage(dataModel: newsModel.data![index]),
                    ));
              },
              child: Container(
                margin: const EdgeInsetsDirectional.only(end: 20),
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ImageComponent(
                              imageUrl: newsModel.data![index].image!,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 160,
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
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SelectableText(
                          newsModel.data![index].subTitle!,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
