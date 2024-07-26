import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yemenshabab/data/models/home/data_type.dart';
import 'package:yemenshabab/data/models/section/category.dart';
import 'package:yemenshabab/data/models/section/section_data_entity.dart';
import 'package:yemenshabab/services/home/service/home_service.dart';
import 'package:yemenshabab/shared/component/category_grid_view.dart';
import 'package:yemenshabab/shared/component/category_list_view.dart';

class VideoListView extends StatefulWidget {
  final HomeService homeService;
  final CategorySection categoryData;

  const VideoListView({
    super.key,
    required this.homeService,
    required this.categoryData,
  });

  @override
  _VideoListViewState createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
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

  Future<void> _fetchPage(int pageKey) async {
    try {
      final category = await widget.homeService.fetchCategoryData(
        dataType: widget.categoryData.dataType.name,
        category: widget.categoryData.nameEn,
        rows: _pageSize,
        first: pageKey,
      );

      var newItems = category.data ?? [];

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
      Layout.LIST => CategoryListView(
          pagingController: _pagingController,
          dataType: widget.categoryData.dataType),
      Layout.GRID => CategoryGridView(
          pagingController: _pagingController,
          dataType: widget.categoryData.dataType),
    };
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
