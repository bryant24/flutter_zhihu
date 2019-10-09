import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'package:flutter_zhihu/home/article.dart';
import 'package:flutter_zhihu/home/reply_page.dart';

class Recommand extends StatefulWidget {
  @override
  _RecommandState createState() => new _RecommandState();
}

class _RecommandState extends State<Recommand>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  Widget userHeader(Article article) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(article.headUrl),
              radius: 10.0,
            ),
            margin: EdgeInsets.only(right: 10.0),
          ),
          new Text(
            article.user,
            style: new TextStyle(
                color: GlobalConfig.fontColor,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      padding: EdgeInsets.only(bottom: 3.0),
      margin: EdgeInsets.only(top: 3.0),
    );
  }

  Widget commonCard(Article article) {
    Widget markWidget;
    if (article.imgUrl == null) {
      markWidget = new Container(
        child: new Column(
          children: <Widget>[
            userHeader(article),
            new Text(
              article.mark,
              style: new TextStyle(
                  color: GlobalConfig.fontColor, height: 1.5, fontSize: 15.0),
            ),
          ],
        ),
      );
    } else {
      markWidget = new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  userHeader(article),
                  new Text(
                    article.mark,
                    style: new TextStyle(
                        height: 1.5,
                        color: GlobalConfig.fontColor,
                        fontSize: 15.0),
                  ),
                ],
              ),
            ),
            flex: 2,
          ),
          new Expanded(
            flex: 1,
            child: new AspectRatio(
              aspectRatio: 3.0 / 2.0,
              child: new Container(
                foregroundDecoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new NetworkImage(article.imgUrl),
                    centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  ),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(6.0)),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: new FlatButton(
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) {
              return new ReplyPage();
            }),
          );
        },
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Text(
                article.title,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    height: 1.5,
                    color: GlobalConfig.dark == true
                        ? Colors.white70
                        : Colors.black),
              ),
              margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
              padding: new EdgeInsets.only(top: 10.0),
              alignment: Alignment.topLeft,
            ),
            new Container(
              child: markWidget,
              margin: new EdgeInsets.only(top: 6.0, bottom: 14.0),
              alignment: Alignment.topLeft,
            ),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Text(
                      article.agreeNum.toString() +
                          " 赞同 · " +
                          article.commentNum.toString() +
                          "评论",
                      style: new TextStyle(color: GlobalConfig.fontColor),
                    ),
                  ),
                  new Icon(Icons.linear_scale, color: GlobalConfig.fontColor)
                ],
              ),
              padding: const EdgeInsets.only(bottom: 10.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Column(
          children: <Widget>[
            commonCard(articleList[0]),
            commonCard(articleList[1]),
            commonCard(articleList[1]),
            commonCard(articleList[1]),
          ],
        ),
      ),
    );
  }
}
