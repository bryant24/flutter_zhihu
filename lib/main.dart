import 'package:flutter/material.dart';
import 'package:flutter_zhihu/splash.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(new ZhiHu());
}

class ZhiHu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "知乎-高仿版",
      home: new SplashPage(),
    );
  }
}
