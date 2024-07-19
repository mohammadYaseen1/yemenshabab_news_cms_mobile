import 'package:flutter/material.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/data.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_model.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/tag.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/news_details_page.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/video_details_page.dart';

class CustomsListView extends StatelessWidget {
  const CustomsListView({
    required this.newsModel,
    super.key,
  });

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
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
              Icon(
                isArabic(context)
                    ? Icons.arrow_back_rounded
                    : Icons.arrow_forward_rounded,
                size: 30,
              ),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: List.generate(
              newsModel.data!.length * 2 - 1,
                  (index) =>
              index % 2 == 0
                  ? InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context, _createRoute(newsModel.data![index]));
                },
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:
                      ImageComponent(
                        imageUrl: newsModel.data![index ~/ 2].image!,),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Tag(
                            tagName: newsModel.data![index ~/ 2].tag!,
                            color: newsModel.data![index ~/ 2].color!,
                            width: 120,
                          ),
                          SizedBox(height: 10),
                          Text(
                            newsModel.data![index ~/ 2].title!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Text(
                            newsModel.data![index ~/ 2].time!,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
