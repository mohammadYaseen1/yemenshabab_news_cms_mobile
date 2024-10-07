import 'package:flutter/material.dart';
import 'package:yemenshabab/shared/constants/constants.dart';
import 'package:yemenshabab/shared/utils/utils.dart';
import 'package:yemenshabab/views/search_page.dart';

class CustomSearchDelegate extends SearchDelegate {
  // List<String> searchTerms = CacheHelper.getListData(key: 'searchTerms') ?? [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear_rounded),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Padding(
        padding: EdgeInsetsDirectional.only(start: isArabic(context) ? 30 : 0),
        child: Icon(
          isArabic(context)
              ? Icons.arrow_forward_ios_rounded
              : Icons.arrow_back_ios_new_rounded,
        ),
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // if (query.isNotEmpty)
    //   CacheHelper.setData(key: 'searchTerms', value: searchTerms..add(query));
    return SearchPage(
        homeService: homeController.newsCubit.homeService, searchTarget: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
