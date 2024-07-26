import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yemenshabab/data/models/playlist_entity.dart';
import 'package:yemenshabab/gen/assets.gen.dart';
import 'package:yemenshabab/services/home/service/home_service.dart';
import 'package:yemenshabab/shared/component/image_component.dart';
import 'package:yemenshabab/shared/utils.dart';
import 'package:yemenshabab/views/home/playlist_details_page.dart';

class PlaylistView extends StatefulWidget {
  final HomeService homeService;
  final String playlistId;

  const PlaylistView({
    super.key,
    required this.homeService,
    required this.playlistId,
  });

  @override
  _PlaylistViewState createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  static const _pageSize = 10;

  final PagingController<int, PlaylistItems> _pagingController =
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
      final playlist = await widget.homeService
          .fetchPlaylist(widget.playlistId, _pageSize + pageKey);
      playlist.items!.removeWhere((item) =>
          ["Deleted video", "Private video"].contains(item.snippet!.title));
      var newItems = playlist.items ?? [];
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PagedGridView<int, PlaylistItems>(
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        pagingController: _pagingController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 100 / 100,
          crossAxisSpacing: 15,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
        ),
        builderDelegate: PagedChildBuilderDelegate<PlaylistItems>(
          itemBuilder: (context, item, index) => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    createRoute(() =>
                        PlaylistDetailsPage(item: item)),
                  );
                },
                child: buildProgramCard(item, context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProgramCard(PlaylistItems item, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 125,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ImageComponent(imageUrl:
              item.snippet!.thumbnails!.standard!.url!,

            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                item.snippet!.title!,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
