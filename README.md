# vconsole

Vconsole for flutter.

## 说明
为[webview_flutter](https://pub.flutter-io.cn/packages/webview_flutter)添加vconsole


## 配置依赖包
```
dependencies:
  vconsole: ^0.0.2
```

## 使用
```
// import vconsole
import 'package:vconsole/vconsole.dart';
// onPageStarted add vconsole
Vconsole(_webViewController).dispatch();
```

## 例子
在webview页面添加JavascriptChannel
webview.dart
```
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:vconsole/vconsole.dart';

class WebviewPage extends StatefulWidget {
  final String url;
  final VoidCallback backCallback;

  WebviewPage({
    Key key,
    @required this.url,
    this.backCallback,
  }) : super(key: key);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  String _title = 'vconsole';
  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(const IconData(0xe61b, fontFamily: 'IconFont'), color: Color(0xff333333), size: 18),
          onPressed: () => Application.router.pop(context),
        ),
        title: new Text(
          '$_title',
          style: TextStyle(color: Color(0xff333333), fontSize: 17),
        ),
        backgroundColor: Color(0xffffffff),
        shadowColor: Colors.transparent,
        centerTitle: true,
        actions: [
          FutureBuilder<WebViewController>(
            builder: (BuildContext context, AsyncSnapshot<WebViewController> controller) {
              return IconButton(
                onPressed: () {
                  reloadWebView();
                },
                icon: new Icon(
                  Icons.refresh_outlined,
                  color: Color(0xff333333),
                  size: 20
                )
              );
            }
          ),
        ],
      ),
      body: WebView(
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        initialUrl: widget.url,
        onPageStarted: (String url) {
          if (url.startsWith("mailto") || url.startsWith("tel") || url.startsWith("http") || url.startsWith("https")) {
            // add vconsole
            Vconsole(_webViewController).dispatch();
          } else {
            _webViewController.goBack();
          }
        },
        onPageFinished: (controller) {
          // 获取页面标题
          setState(() {
            _title = _webViewController.getTitle() as String;
          });
        },
      )
    );
  }
  void reloadWebView() {
    _webViewController?.reload();
  }
}
```