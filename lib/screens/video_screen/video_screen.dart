import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;

  const VideoPlayerScreen({Key? key, required this.url}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform:
                  InAppWebViewOptions(useShouldOverrideUrlLoading: true),
              android: AndroidInAppWebViewOptions(),
              ios: IOSInAppWebViewOptions(
                allowsInlineMediaPlayback: false,
              ),
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
          ),
        ),
      ),
    );
  }
}
