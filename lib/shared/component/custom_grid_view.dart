import 'package:flutter/material.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_model.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/shared/widget/news_widget.dart';
import 'package:yemenshabab/views/home/news_details_page.dart';
import 'package:yemenshabab/views/home/video_details_page.dart';

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
        const SizedBox(height: 20),
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
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 30,
                    ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 20),
        Container(
          constraints: const BoxConstraints(maxHeight: 330),
          child: ListView.builder(
              itemCount: newsModel.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => NewsWidget(
                    isFavorite: false,
                    valueChanged: (value) {},
                    onTap: () {
                      Navigator.push(
                          context, _createRoute(newsModel.data![index]));
                    },
                    onPressedFav: () {},
                    title: newsModel.data![index].title!,
                    time: newsModel.data![index].time!,
                    imageUrl: newsModel.data![index].image!,
                  )),
        ),
      ],
    );
  }

  Route _createRoute(DataModel dataModel) {
    return createRoute(
      () => dataModel.dataType == ViewType.VIDEO
          ? VideoDetailsPage(dataModel: dataModel)
          : NewsDetailsPage(dataModel: dataModel),
    );
  }
}
