import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';
import 'package:flutter_zhihu/home/article.dart';
import 'package:flutter_zhihu/home/reply_page.dart';

class Follow extends StatefulWidget {
  Follow({Key key, this.filterVisible}) : super(key: key);

  bool filterVisible;

  @override
  _FollowState createState() => new _FollowState();
}

class _FollowState extends State<Follow> with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  Widget wordsCard(Article article) {
    Widget markWidget;
    if (article.imgUrl == null) {
      markWidget = new Text(
        article.mark,
        style: new TextStyle(height: 1.3, color: GlobalConfig.fontColor),
      );
    } else {
      markWidget = new Row(
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Container(
              child: new Text(
                article.mark,
                style: new TextStyle(
                    height: 1.5, color: GlobalConfig.fontColor, fontSize: 15.0),
              ),
              margin: EdgeInsets.only(right: 3.0),
            ),
          ),
          new Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 3.0 / 2.2,
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
          )
        ],
      );
    }

    return new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: new FlatButton(
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new ReplyPage();
          }));
        },
        child: new Column(
          children: <Widget>[
            new Container(
              child: new ListTile(
                leading: new CircleAvatar(
                  backgroundImage: new NetworkImage(article.headUrl),
                  radius: 20.0,
                ),
                title: new Text(
                  article.user,
                ),
                subtitle: new Text(article.action,
                    style: new TextStyle(color: GlobalConfig.fontColor)),
                trailing: new Text(article.time,
                    style: new TextStyle(color: GlobalConfig.fontColor)),
              ),
            ),
            new Container(
              child: new Text(
                article.title,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  height: 1.5,
                  color:
                      GlobalConfig.dark == true ? Colors.white70 : Colors.black,
                ),
              ),
              margin: new EdgeInsets.only(
                  top: 0.0, bottom: 0.0, left: 16.0, right: 12.0),
              alignment: Alignment.topLeft,
            ),
            new Container(
              child: markWidget,
              margin: new EdgeInsets.only(top: 5.0, left: 16.0, right: 16.0),
              alignment: Alignment.topLeft,
            ),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text(
                            article.agreeNum.toString() +
                                " 赞同 · " +
                                article.commentNum.toString() +
                                " 评论",
                            style: new TextStyle(color: GlobalConfig.fontColor),
                          ),
                        ),
                        new PopupMenuButton(
                            icon: new Icon(
                              Icons.more_horiz,
                              color: GlobalConfig.fontColor,
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuItem<String>>[
                                  new PopupMenuItem<String>(
                                    value: '选项一的值',
                                    child: new Text("屏蔽这个问题"),
                                  ),
                                  new PopupMenuItem<String>(
                                    value: '选项二的值',
                                    child: new Text("取消关注"),
                                  ),
                                  new PopupMenuItem<String>(
                                    value: '选项三的值',
                                    child: new Text("举报"),
                                  ),
                                ])
                      ],
                    ),
                  ),
                ],
              ),
              margin: const EdgeInsets.only(left: 16.0, right: 8.0),
            ),
          ],
        ),
        padding: const EdgeInsets.all(0.0),
      ),
    );
  }

  Widget filterFocus() {
    return new Stack(
      children: <Widget>[
        new Container(
          child: new Row(
            children: <Widget>[
              new OutlineButton(
                onPressed: null,
                child: new Text("全部"),
              ),
              new OutlineButton(
                onPressed: null,
                child: new Text("只看原创"),
              ),
              new OutlineButton(
                onPressed: null,
                child: new Text("只看想法"),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        )
      ],
    );
  }

  Widget billboard() {
    return new Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      color: GlobalConfig.cardBackgroundColor,
      child: new FlatButton(
        onPressed: () {},
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            "https://pic1.zhimg.com/50/v2-0c9de2012cc4c5e8b01657d96da35534_s.jpg"),
                        radius: 11.0),
                  ),
                  new Text("  对啊网",
                      style: new TextStyle(color: GlobalConfig.fontColor))
                ],
              ),
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new Container(
              child: new Text(
                "考过CPA，非名牌大学也能进名企",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    height: 1.3,
                    color: GlobalConfig.dark == true
                        ? Colors.white70
                        : Colors.black),
              ),
              margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
              alignment: Alignment.topLeft,
            ),
            new Container(
                child: new AspectRatio(
                    aspectRatio: 3.0 / 1.0,
                    child: new Container(
                      foregroundDecoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new NetworkImage(
                                "https://pic2.zhimg.com/50/v2-6416ef6d3181117a0177275286fac8f3_hd.jpg"),
                            centerSlice:
                                new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                          ),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(6.0))),
                    )),
                margin: new EdgeInsets.only(top: 6.0, bottom: 14.0),
                alignment: Alignment.topLeft),
            new Container(
                child: new Text("还在羡慕别人的好工作？免费领取价值1980元的注册会计师课程，为自己充电！",
                    style: new TextStyle(
                        height: 1.3, color: GlobalConfig.fontColor)),
                padding: const EdgeInsets.only(bottom: 8.0)),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: new Text(
                      "广告",
                      style: new TextStyle(
                          fontSize: 10.0, color: GlobalConfig.fontColor),
                    ),
                    decoration: new BoxDecoration(
                      border: new Border.all(color: GlobalConfig.fontColor),
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(2.0),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        top: 2.0, bottom: 2.0, left: 3.0, right: 3.0),
                  ),
                  new Expanded(
                    child: new Text(
                      "  查看详情",
                      style: new TextStyle(color: GlobalConfig.fontColor),
                    ),
                  ),
                  new Icon(Icons.clear, color: GlobalConfig.fontColor)
                ],
              ),
              padding: const EdgeInsets.only(bottom: 10.0),
            )
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
            widget.filterVisible == true ? filterFocus() : new Container(),
            wordsCard(articleList[0]),
            wordsCard(articleList[1]),
            wordsCard(articleList[2]),
            billboard(),
            wordsCard(articleList[3])
          ],
        ),
      ),
    );
  }
}
