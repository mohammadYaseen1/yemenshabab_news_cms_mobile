import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/data/models/search_entity.dart';
import 'package:yemenshabab/services/home/service/home_service.dart';
import 'package:yemenshabab/shared/component/CustomFirstPageErrorIndicator.dart';
import 'package:yemenshabab/shared/component/loading.dart';
import 'package:yemenshabab/shared/component/no_items_found_indicator.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/shared/utils/utils.dart';
import 'package:yemenshabab/views/home/news_details_page.dart';
import 'package:yemenshabab/views/home/program_details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    required this.homeService,
    required this.searchTarget,
  }) : super(key: key);
  final HomeService homeService;
  final String searchTarget;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static const _pageSize = 10;

  final PagingController<int, SearchSearchItems> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<SearchSearchItems> newItems = [];
      if (widget.searchTarget.isNotEmpty) {
        final items = await widget.homeService.search(
          searchTarget: widget.searchTarget,
          rows: _pageSize,
          first: pageKey,
        );
        newItems = items.searchItems ?? [];
      }
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, SearchSearchItems>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<SearchSearchItems>(
          itemBuilder: (context, item, index) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      List<String> routes = item.route!.split("/");
                      String uuid = routes.last;
                      String type = routes.first;
                      Navigator.of(context).push(
                        createRoute(() =>
                        switch (type) {
                          'programs' => ProgramDetailsPage(uuid: uuid),
                          String() =>
                              NewsDetailsPage(
                                dataModel: DataModel(
                                    uuid: uuid,
                                    dataType: ViewType.valueOf(routes[1])),
                              ),
                        }),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        isArabic(context) ? item.titleAr! : item.titleEn!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitleTextStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(isArabic(context)
                            ? item.subtitleAr!
                            : item.subtitleEn!),
                      ),
                    ),
                  ),
                ),
              ),
          noItemsFoundIndicatorBuilder: (context) =>
          const CustomNoItemsFoundIndicator(),
          firstPageProgressIndicatorBuilder: (context) => const LoadingScreen(),
          firstPageErrorIndicatorBuilder: (context) =>
              CustomFirstPageErrorIndicator(
                onTryAgain: _pagingController.retryLastFailedRequest,
              ),
          animateTransitions: true),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
