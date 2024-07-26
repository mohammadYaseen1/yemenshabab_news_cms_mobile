import 'package:flutter/material.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/data.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_model.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/program_status.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/banner_basic.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/image_component.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/program_details_page.dart';

class ProgramView extends StatelessWidget {
  const ProgramView({
    required this.newsModel,
    super.key,
  });

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    DataModel firstProgram = newsModel.data!.first;
    List<DataModel> otherPrograms = newsModel.data!.skip(1).toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {},
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
                // Icon(
                //   Icons.arrow_forward_rounded,
                //   size: 30,
                // ),
              ],
            ),
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              Container(
                height: 250,
                child: InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        createRoute(
                          () => ProgramDetailsPage(uuid: firstProgram.uuid!),
                        ));
                  },
                  child: buildProgram(firstProgram, context),
                ),
              ),
              SizedBox(height: 10),
              Container(
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: otherPrograms.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            createRoute(
                              () => ProgramDetailsPage(
                                  uuid: otherPrograms[index].uuid!),
                            ));
                      },
                      child: buildProgram(otherPrograms[index], context),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int getLength() {
    var length = newsModel.data!.length;
    return length >= 4 ? 4 : length;
  }

  Container buildProgram(DataModel model, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ProgramStatus status = ProgramStatus.valueOf(model.subTitle!);
    return Container(
      // height: 120,
      child: BannerBasicPage(
        title: ProgramStatus.titleOf(context, status: status)!,
        color: status.color,
        fontSize: status == ProgramStatus.AIRING ? 12 : 15,
        widget: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              // width: 199,
              // height: 120,
              child: ImageComponent(
                imageUrl: model.image!,
              ),
            ),
            Container(
              // width: 199,
              // height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient:
                    LinearGradient(begin: Alignment.bottomRight, stops: const [
                  0.1,
                  0.5,
                  1,
                ], colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(0)
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.title!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
