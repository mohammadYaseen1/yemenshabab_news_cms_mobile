import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: ZoomDrawer.of(context)!.toggle,
      child: const Center(child: Icon(Icons.menu_rounded)));
}
