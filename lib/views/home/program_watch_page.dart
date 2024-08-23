import 'package:flutter/material.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/shared/component/playlist_view.dart';

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
