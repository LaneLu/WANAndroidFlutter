import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatefulWidget {
  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  var isVisible = true;

  @override
  Widget build(BuildContext context) {
    var args = jsonDecode(ModalRoute.of(context).settings.arguments);
    var url = args["url"];
    return Scaffold(
      appBar: AppBar(
        title: Text(args["title"]),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: onPageFinished,
          ),
          Visibility(
            visible: isVisible,
            child: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onPageFinished(str) {
    setState(() {
      isVisible = false;
    });
  }
}
