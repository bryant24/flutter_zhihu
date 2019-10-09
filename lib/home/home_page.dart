import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'package:flutter_zhihu/home/ask_page.dart';
import 'package:flutter_zhihu/home/follow.dart';
import 'package:flutter_zhihu/home/hot.dart';
import 'package:flutter_zhihu/home/recommand.dart';
import 'package:flutter_zhihu/home/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTopTabIndex = 0;
  bool _FilterVisible = false;

  Widget barSearch() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new SearchPage();
                }));
              },
              icon: new Icon(
                Icons.search,
                color: GlobalConfig.fontColor,
                size: 16.0,
              ),
              label: new Text(
                "坚果摄像头损坏",
                style: new TextStyle(color: GlobalConfig.fontColor),
              ),
            ),
          ),
          new Container(
            decoration: new BoxDecoration(
              border: new BorderDirectional(
                start:
                    new BorderSide(color: GlobalConfig.fontColor, width: 1.0),
              ),
            ),
            height: 14.0,
            width: 1.0,
          ),
          new Container(
            child: new FlatButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new AskPage();
                }));
              },
              icon: new Icon(
                Icons.border_color,
                color: GlobalConfig.fontColor,
                size: 14.0,
              ),
              label: new Text(
                "提问",
                style: new TextStyle(color: GlobalConfig.fontColor),
              ),
            ),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        color: GlobalConfig.searchBackgroundColor,
      ),
    );
  }

  void _changeFilterVisible() {
    setState(() {
      _FilterVisible = !_FilterVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: barSearch(),
          bottom: new TabBar(
            tabs: [
              new Tab(
                child: new Container(
                  child: new Row(
                    children: <Widget>[
                      new Text("关注"),
                      new Text(
                        " · ",
                        style: new TextStyle(color: Colors.red, fontSize: 24.0),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),
              new Tab(text: "推荐"),
              new Tab(text: "热榜"),
            ],
            indicatorColor: Colors.blue,
            onTap: (index) {
              if (index == 0 && index == _currentTopTabIndex) {
                _changeFilterVisible();
              }
              setState(() {
                _currentTopTabIndex = index;
              });
            },
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Follow(filterVisible: _FilterVisible),
            new Recommand(),
            new Hot(),
          ],
        ),
      ),
    );
  }
}
