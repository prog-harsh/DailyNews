import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

class WebScreen extends StatefulWidget {
  final _url;
  const WebScreen(this._url);

  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  late WebViewController controller;
  var isLoading = false;
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget._url);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DailyNews',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: widget._url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (web) {
            controller = web;
          },
        ),
      ),
    );
  }
}
