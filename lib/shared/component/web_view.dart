import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:yemenshabab/gen/assets.gen.dart';
import 'package:yemenshabab/core/constants/constants.dart';

class WebView extends StatefulWidget {
  const WebView({super.key, required this.url});

  final String url;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  // late final WebViewController _controller;
  bool loaded = false;
  late Floating floating;

  @override
  void initState() {
    super.initState();
    loaded = false;
    floating = Floating();
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..loadRequest(Uri.parse(widget.url));
    viewController = controller;
    Future.delayed(
      Duration(seconds: 2),
      () {
        setState(() {
          loaded = true;
        });
      },
    );
  }

  Widget justVideo() {
    return WebViewWidget(controller: viewController!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        justVideo(),
        if (!loaded)
          Container(
            color: Theme.of(context).cardColor,
            child: Center(
              child: LoadingFadingLine.square(
                itemBuilder: (context, index) =>
                    Assets.images.logo2Crop.image(),
                size: 100,
              ),
            ),
          )
      ],
    );
  }
}
