import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'package:flutter_zhihu/home/question_page.dart';
import 'package:flutter_zhihu/models/index.dart';

class Common {
  static Widget searchInput(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: new Icon(Icons.arrow_back, color: GlobalConfig.fontColor),
              label: new Text(""),
            ),
            width: 60.0,
          ),
          new Expanded(
            child: new TextField(
              decoration: new InputDecoration.collapsed(
                hintText: "搜索知乎内容",
                hintStyle: new TextStyle(color: GlobalConfig.fontColor),
              ),
            ),
          ),
          new Container(
            child: IconButton(
              icon: new Icon(Icons.share, color: GlobalConfig.fontColor),
              onPressed: () {},
              padding: const EdgeInsets.all(0.0),
              iconSize: 18.0,
            ),
          ),
          new Container(
            child: new IconButton(
              icon: new Icon(Icons.list, color: GlobalConfig.fontColor),
              onPressed: () {},
              padding: const EdgeInsets.all(0.0),
              iconSize: 18.0,
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        color: GlobalConfig.searchBackgroundColor,
      ),
      height: 36.0,
    );
  }
}

class ReplyPage extends StatefulWidget {
  @override
  _ReplyPageState createState() => new _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {
  int Focused = 0;
  int t;

  @override
  void initState() {
    super.initState();
    String stu =
        '{"id":"487349","name":"Pooja Bhaumik","score" : 1000,"focused": 0}';
    Student st = Student.fromJson(jsonDecode(stu));
    Focused = st.focused;

    t = 3;
  }

  void SetFocused() async {
    if (Focused == 1 || Focused == 2) {
      return null;
    }
    setState(() {
      Focused = 1;
    });

    Timer(const Duration(seconds: 1), () {
      setState(() {
        t = 3;
        Timer(const Duration(seconds: 1), () {
          setState(() {
            t = 2;
            Timer(const Duration(seconds: 1), () {
              setState(() {
                t = 1;
                Focused = 2;
              });
            });
          });
        });
      });
    });

//    Timer(const Duration(seconds: 3), () {
//      setState(() {
//        Focused = 2;
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        appBar: new AppBar(
          title: Common.searchInput(context),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (context) {
                      return new QuestionPage();
                    }));
                  },
                  child: new Container(
                    child: new Text(
                      "你认为《三体》中最牛的文明是？",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          height: 1.3,
                          color: GlobalConfig.dark == true
                              ? Colors.white70
                              : Colors.black),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.topLeft,
                  ),
                ),
                decoration: new BoxDecoration(
                  border: new BorderDirectional(
                    bottom: new BorderSide(color: Colors.white10),
                  ),
                ),
              ),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 1,
                      child: new Container(
                        child: new FlatButton.icon(
                          onPressed: () {},
                          icon: new Icon(Icons.brush),
                          label: new Text("写回答"),
                          textTheme: ButtonTextTheme.accent,
                        ),
                        decoration: new BoxDecoration(
                          border: new BorderDirectional(
                            end: new BorderSide(color: Colors.white10),
                          ),
                        ),
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: new Container(
                        child: new FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              new MaterialPageRoute(builder: (context) {
                                return new QuestionPage();
                              }),
                            );
                          },
                          child: new Text("查看全部10000个回答 > "),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: new BoxDecoration(
                  color: GlobalConfig.cardBackgroundColor,
                ),
                margin: const EdgeInsets.only(bottom: 10.0),
              ),
              new Container(
                child: new ListTile(
                  leading: new CircleAvatar(
                    backgroundImage: new NetworkImage(
                        "https://pic3.zhimg.com/v2-cd467bb9bb31d0384f065cf0bd677930_xl.jpg"),
                    radius: 20.0,
                  ),
                  title: new Text("Flutter"),
                  subtitle: new Text("人生如逆旅，我亦是行人"),
                  trailing: new RaisedButton.icon(
                    onPressed: () {
                      SetFocused();
                    },
                    icon: new Icon(
                        Focused == 0
                            ? Icons.add
                            : Focused == 1 ? Icons.search : Icons.done,
                        color: Colors.white),
                    label: new Text(
                      Focused == 1 ? t.toString() : Focused != 2 ? "关注" : "已关注",
                      style: new TextStyle(color: Colors.white),
                    ),
                    color: Focused != 2 ? Colors.blue : Colors.grey,
                  ),
                ),
                decoration: new BoxDecoration(
                  color: GlobalConfig.cardBackgroundColor,
                  border: new BorderDirectional(
                    bottom: new BorderSide(color: Colors.white10),
                  ),
                ),
              ),
              new Container(
                child: new Text(
                  "回归运动\n\n三体定义的黑暗森林的宇宙格局，就是文明相互攻击和毁灭，越高级的，越明白藏好自己做好清理，就是文明相互攻击和毁灭，越高级的，越明白藏好自己做好清理,就是文明相互攻击和毁灭，越高级的，越明白藏好自己做好清理就是文明相互攻击和毁灭，越高级的，越明白藏好自己做好清理就是文明相互攻击和毁灭，越高级的，越明白藏好自己做好清理就是文明相互攻击和毁灭，越高级的，越明白藏好自己做好清理绝不做探测对方文明的愚蠢行为。\n\n然而归还运动跳出了这个黑暗森林法则，不玩黑暗森林打击，不但探测别的宇宙文明，而且还深入了解对方文明，而且是全宇宙的所有文明。\n\n这是一种多么自信的科技实力呀，才能跳出黑暗森林的生存法则呀",
                  style: new TextStyle(
                      height: 1.4,
                      fontSize: 16.0,
                      color: GlobalConfig.fontColor),
                  textAlign: TextAlign.start,
                ),
                margin: const EdgeInsets.all(16.0),
              )
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {},
          child: new Icon(Icons.keyboard_arrow_down),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: new BottomAppBar(
          child: new Container(
            height: 55.0,
            child: new Row(
              children: <Widget>[
                new Opacity(
                  opacity: 1.0,
                  child: new Container(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          child: new FlatButton.icon(
                            onPressed: () {},
                            label: new Text("赞同 10k"),
                            icon: new Icon(
                              Icons.arrow_drop_up,
                              size: 30.0,
                            ),
                          ),
                          height: 35.0,
                        ),
                        new Container(
                          decoration: new BoxDecoration(
                            border: new BorderDirectional(
                                start: new BorderSide(
                                    width: 1.0, color: GlobalConfig.fontColor)),
                          ),
                          height: 20.0,
                          width: 1.0,
                        ),
                        new Container(
                          child: new IconButton(
                              icon: new Icon(
                                Icons.arrow_drop_down,
                                size: 30.0,
                              ),
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {}),
                          height: 35.0,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(left: 8.0),
                    decoration: new BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20.0)),
                        color: Colors.blue),
                  ),
                ),
                new Expanded(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                          icon: new Container(
                            child: new Column(
                              children: <Widget>[
                                new Icon(
                                  Icons.favorite_border,
                                  size: 20.0,
                                  color: GlobalConfig.fontColor,
                                ),
                                new Text(
                                  "感谢",
                                  style: new TextStyle(
                                      fontSize: 8.0,
                                      color: GlobalConfig.fontColor),
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.only(),
                            height: 35.0,
                          ),
                          onPressed: () {}),
                      new IconButton(
                          icon: new Container(
                            child: new Column(
                              children: <Widget>[
                                new Icon(
                                  Icons.star_border,
                                  size: 20.0,
                                  color: GlobalConfig.fontColor,
                                ),
                                new Text(
                                  "收藏",
                                  style: new TextStyle(
                                      fontSize: 8.0,
                                      color: GlobalConfig.fontColor),
                                )
                              ],
                            ),
                            margin: const EdgeInsets.only(),
                            height: 35.0,
                          ),
                          onPressed: () {}),
                      new IconButton(
                          icon: new Container(
                            child: new Column(
                              children: <Widget>[
                                new Icon(
                                  Icons.mode_comment,
                                  size: 20.0,
                                  color: GlobalConfig.fontColor,
                                ),
                                new Text(
                                  "评论",
                                  style: new TextStyle(
                                      fontSize: 8.0,
                                      color: GlobalConfig.fontColor),
                                )
                              ],
                            ),
                            margin: const EdgeInsets.only(),
                            height: 35.0,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
