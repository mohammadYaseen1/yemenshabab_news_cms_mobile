import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yemenshabab/data/models/home/data_type.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/data/models/section/category.dart';
import 'package:yemenshabab/data/models/section/section_data_entity.dart';
import 'package:yemenshabab/services/home/service/home_service.dart';
import 'package:yemenshabab/shared/component/playlist_view.dart';

import 'category_grid_view.dart';

class DefaultListView extends StatefulWidget {
  final HomeService homeService;
  final CategorySection categoryData;
  final List<CategorySection> videoSection;

  const DefaultListView({
    super.key,
    required this.homeService,
    required this.categoryData,
    required this.videoSection,
  });

  @override
  _DefaultListViewState createState() => _DefaultListViewState();
}

class _DefaultListViewState extends State<DefaultListView> {
  static const _pageSize = 10;

  final PagingController<int, SectionDataData> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  bool isPlayList = false;

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<SectionDataData> newItems = [];
      final category = await widget.homeService.fetchCategoryData(
        dataType: widget.categoryData.dataType.name,
        category: widget.categoryData.nameEn,
        rows: _pageSize,
        first: pageKey,
      );
      setState(() {
        isPlayList = category.extra ?? false;
      });
      newItems = category.data ?? [];

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
    return switch (widget.categoryData.layout) {
      Layout.LIST => buildCategoryContent(
          (PagingController<int, SectionDataData> controller, ViewType type) =>
              CategoryGridView(pagingController: controller, dataType: type)),
      Layout.GRID => buildCategoryContent(
          (PagingController<int, SectionDataData> controller, ViewType type) =>
              CategoryGridView(pagingController: controller, dataType: type)),
    };
  }

  BuildCondition buildCategoryContent(
      Widget Function(PagingController<int, SectionDataData>, ViewType) view) {
    print("dataType: ${widget.categoryData.dataType}");
    print("isPlayList: $isPlayList");
    return BuildCondition(
      condition: widget.categoryData.dataType == ViewType.VIDEO && isPlayList,
      builder: (context) => PlaylistView(
        homeService: widget.homeService,
        playlistId: _pagingController.itemList!.first.sourceEn!,
      ),
      fallback: (context) =>
          view(_pagingController, widget.categoryData.dataType),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
