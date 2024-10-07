import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab/layout/navigation_cubit.dart';
import 'package:yemenshabab/views/main/user_info_tile.dart';
import 'package:yemenshabab/views/main/main_screen.dart';


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
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            const SizedBox(width: 16.0),
            AutoSizeText(
              name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const SizedBox(height: 4.0),
            AutoSizeText(
              username,
              style: const TextStyle(
                fontSize: 16.0,

                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
              minFontSize: 15,
              // overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
