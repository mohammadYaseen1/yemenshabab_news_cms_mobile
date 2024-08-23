import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/services/home/cubits/news_cubit.dart';
import 'package:yemenshabab/services/home/models/landing/data.dart';
import 'package:yemenshabab/services/home/models/landing/item.dart';
import 'package:yemenshabab/shared/component/image_component.dart';
import 'package:yemenshabab/shared/component/loading.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/views/home/news_details_page.dart';

class KeywordDetailsPage extends StatelessWidget {
  const KeywordDetailsPage(
      {super.key, required this.dataType, required this.keyword});

  final ViewType dataType;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeController.newNewsCubit()
        ..getNewsByKeywords(dataType.name, [keyword]),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                keyword,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            body: state is NewsByKeywordsLoaded
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state.data.items != null &&
                              state.data.items!.isNotEmpty)
                            buildExtraNews(state.data, context),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  )
                : const LoadingScreen(),
          );
        },
      ),
    );
  }

  Widget buildExtraNews(Data extraNews, BuildContext context) {
    List<Item> items = extraNews.items!;
    if (items.isEmpty) return const SizedBox();
    return Column(
      children: [
        Divider(
          color: Theme.of(context).cardColor,
        ),
        const SizedBox(height: 10),
        ...List.generate(
          items.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).push(createRoute(
                  () => NewsDetailsPage(
                      dataModel: DataModel(
                    uuid: items[index].uuid,
                    dataType: ViewType.valueOf(extraNews.dataType),
                    color: parseColorString(items[index].categoryColor!),
                  )),
                ));
              },
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxHeight: 100),
                      width: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ImageComponent(imageUrl: items[index].image!),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                isArabic(context)
                                    ? items[index].category!
                                    : items[index].categoryEn!,
                                style: TextStyle(
                                    color: parseColorString(
                                        items[index].categoryColor!)),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                width: 2,
                                height: 13,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(width: 5),
                              AutoSizeText(
                                getFormattedDate(items[index].date!),
                                maxLines: 2,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            isArabic(context)
                                ? items[index].title!
                                : items[index].subtitle!,
                            style: const TextStyle(
                              // fontSize: 18,
                              fontWeight: FontWeight.bold,
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
        )
      ],
    );
  }
}
