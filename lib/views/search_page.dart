import 'package:flutter/material.dart';
import 'package:yemenshabab_news_cms_mobile/gen/assets.gen.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/animated_search_bar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPreferredSize(),
      body: Container(),
    );
  }

  PreferredSize buildPreferredSize() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 65),
      child: SafeArea(
        child: AnimationSearchBar(
          centerIcon: Assets.images.logo.image(
            fit: BoxFit.contain,
            height: 70,
          ),
          isBackButtonVisible: true,
          onChanged: (text) {},
          onSubmit: (value) {},
          searchTextEditingController: _controller,
          horizontalPadding: 5,
        ),
      ),
    );
  }
}
