import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/data/models/playlist_entity.dart';
import 'package:yemenshabab/shared/component/youtube_player.dart';

class PlaylistDetailsPage extends StatefulWidget {
  const PlaylistDetailsPage({super.key, required this.item});

  final PlaylistItems item;

  @override
  State<PlaylistDetailsPage> createState() => _PlaylistDetailsPageState();
}

class _PlaylistDetailsPageState extends State<PlaylistDetailsPage> {
  late Floating floating;

  @override
  void initState() {
    super.initState();
    floating = Floating();
    enable();
  }

  void enable() async {
    await floating.enable(const OnLeavePiP());
  }

  void disable() async {
    await floating.cancelOnLeavePiP();
  }

  @override
  void dispose() {
    disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PiPSwitcher(
      floating: floating,
      childWhenEnabled: CustomYouTubePlayer(
          id: widget.item.snippet?.resourceId?.videoId ?? ''),
      childWhenDisabled: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.item.snippet?.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      getFormattedDate(widget.item.snippet?.publishedAt ?? '',
                          Localizations.localeOf(context).toLanguageTag()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: CustomYouTubePlayer(
                        id: widget.item.snippet?.resourceId?.videoId ?? ''),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SelectionArea(
                      child: HtmlWidget(
                        widget.item.snippet?.description ?? '',
                        renderMode: RenderMode.column,
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
