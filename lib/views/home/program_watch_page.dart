import 'package:flutter/material.dart';
import 'package:yemenshabab/shared/component/back_component.dart';
import 'package:yemenshabab/shared/component/playlist_view.dart';
import 'package:yemenshabab/shared/constants/constants.dart';

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
        leading: const BackComponent(),
      ),
      body: PlaylistView(
          homeService: homeController.newPlaylistCubit().homeService,
          playlistId: playlist),
    );
  }
}
