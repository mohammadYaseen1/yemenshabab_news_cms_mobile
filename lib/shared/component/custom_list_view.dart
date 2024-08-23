import 'package:flutter/material.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/data/models/home/news/news_model.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/shared/component/image_component.dart';
import 'package:yemenshabab/shared/component/tag.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/views/home/news_details_page.dart';
import 'package:yemenshabab/views/home/video_details_page.dart';

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
              const Icon(
                Icons.arrow_forward_rounded,
                size: 30,
              ),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: List.generate(
              newsModel.data!.length * 2 - 1,
              (index) => index % 2 == 0
                  ? InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            createRoute(
                              () => newsModel.data![index].dataType ==
                                      ViewType.VIDEO
                                  ? VideoDetailsPage(
                                      dataModel: newsModel.data![index])
                                  : NewsDetailsPage(
                                      dataModel: newsModel.data![index]),
                            ));
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
                            child: ImageComponent(
                              imageUrl: newsModel.data![index ~/ 2].image!,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Tag(
                                  tagName: newsModel.data![index ~/ 2].tag!,
                                  color: newsModel.data![index ~/ 2].color!,
                                  width: 120,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  newsModel.data![index ~/ 2].title!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  newsModel.data![index ~/ 2].time!,
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
                    )
                  : const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
