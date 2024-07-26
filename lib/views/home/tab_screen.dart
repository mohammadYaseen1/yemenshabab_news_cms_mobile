import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/data/models/section/category.dart';
import 'package:yemenshabab/services/category_cubit.dart';
import 'package:yemenshabab/shared/component/default_list_view.dart';
import 'package:yemenshabab/shared/constants/constants.dart';

class TabScreen extends StatefulWidget {
  TabScreen(
      {Key? key,
      required this.categoryData,
      required this.videoSection,
      this.index})
      : super(key: key);

  final int? index;
  final List<CategorySection> categoryData;
  final List<CategorySection> videoSection;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late CategorySection? category;

  @override
  void initState() {
    category = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.categoryData);

    return BlocProvider(
      create: (context) => homeController.newCategoryCubit(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          category = null;

          if (state is NavigateCategory) {
            WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
                  category = state.category;
                }));
          }
        },
        builder: (context, state) {
          var categoryCubit = CategoryCubit.get(context);
          return Container(
            child: DefaultListView(
              homeService: homeController.newsCubit.homeService,
              categoryData: (state is NavigateCategory)
                  ? category!
                  : widget.categoryData.first,
              videoSection: widget.videoSection,
            ),
          );
        },
      ),
    );
  }
}
