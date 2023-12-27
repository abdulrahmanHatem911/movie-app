import 'package:film/core/utills/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WatchMoviesView extends StatefulWidget {
  final String movieID;
  const WatchMoviesView({super.key, required this.movieID});

  @override
  State<WatchMoviesView> createState() => _WatchMoviesViewState();
}

class _WatchMoviesViewState extends State<WatchMoviesView> {
  WebViewController? _controller;
  bool _isLandscape = false;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('${AppConstant.videoBaseUrl}${widget.movieID}'));
  }

  void dispose() {
    _controller?.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch Movie'),
        actions: [
          IconButton(
            onPressed: () {
              if (_isLandscape) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
              } else {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
              }
              _isLandscape = !_isLandscape;
            },
            icon: const Icon(Icons.screen_rotation),
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller!),
    );
  }
}
