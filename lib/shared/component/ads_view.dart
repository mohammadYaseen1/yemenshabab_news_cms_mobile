import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab/shared/component/image_component.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/views/home/news_details_page.dart';
import 'package:yemenshabab/views/home/video_details_page.dart';

class AdsView extends StatelessWidget {
  const AdsView({
    required this.dataModel,
    super.key,
    this.category,
  });

  final SectionDate? category;
  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await customLaunchUrl(Uri.parse(dataModel.subTitle!))
          },
          onLongPress: () {
            // print("onLongPress");
          },
          onTapDown: (details) {
            // print("onTapDown");
          },
          onTapUp: (details) {
            // print("onTapUp");
          },
          child: Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ImageComponent(
                  imageUrl: dataModel.image!,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Route _createRoute(DataModel dataModel) {
    return createRoute(
          () =>
      dataModel.dataType == ViewType.VIDEO
          ? VideoDetailsPage(dataModel: dataModel)
          : NewsDetailsPage(dataModel: dataModel),
    );
  }
}
