import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab_news_cms_mobile/layout/navigation_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/views/main/user_info_tile.dart';
import 'package:yemenshabab_news_cms_mobile/views/main/main_screen.dart';


class UserInfoTile extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String username;
  final GestureTapCallback onTab;

  const UserInfoTile({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.username,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
