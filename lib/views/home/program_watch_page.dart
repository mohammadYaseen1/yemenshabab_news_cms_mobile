import 'package:flutter/material.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/playlist_view.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';

class ProgramWatchPage extends StatelessWidget {
  const ProgramWatchPage(
      {super.key, required this.playlist, required this.title});

  final String playlist;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
      ),
      body: PlaylistView(
          homeService: homeController.newPlaylistCubit().homeService,
          playlistId: playlist),
    );
  }
}
