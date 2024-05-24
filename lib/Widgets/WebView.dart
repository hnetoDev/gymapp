import 'package:appgym/Widgets/AppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget{
  String url;
  WebView(this.url,{super.key});

  @override
  State<WebView> createState() => _WebViewState(url);
}

class _WebViewState extends State<WebView>{
  String url;
  _WebViewState(this.url);

  late final WebViewController controller;



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarCustom(),
      body: WebViewWidget(controller: controller,),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(url)
    )..setJavaScriptMode(JavaScriptMode.unrestricted);
  }
}