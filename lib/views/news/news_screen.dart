import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/services/news/controllers/news_controller.dart';
import 'package:yemenshabab/services/news/cubits/news_cubit.dart';
import 'package:yemenshabab/shared/component/image_component.dart';

class NewsScreen extends StatelessWidget {
  final NewsController newsController = NewsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: BlocProvider(
        create: (_) => newsController.newsCubit..fetchNews(),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded) {
              return ListView.builder(
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  final article = state.news[index];
                  return ListTile(
                    title: Text(article.title),
                    leading: article.imageUrl.isNotEmpty
                        ? ImageComponent(imageUrl: article.imageUrl)
                        : null,
                  );
                },
              );
            } else if (state is NewsError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
