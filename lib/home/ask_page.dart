import 'package:flutter/material.dart';
import 'package:flutter_zhihu/global_config.dart';

class AskPage extends StatefulWidget {
  @override
  _AskPageState createState() => new _AskPageState();
}

class _AskPageState extends State<AskPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: new Icon(Icons.clear, color: Colors.white70),
                  ),
                  width: 60.0,
                ),
                new Expanded(
                  child: new Container(
                    child: new Text("提问"),
                  ),
                ),
                new FlatButton(
                    onPressed: () {},
                    child: new Text(
                      "下一步",
                      style: new TextStyle(color: Colors.white12),
                    ))
              ],
            ),
          ),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                      hintStyle: new TextStyle(color: Colors.white70),
                      hintText: "请输入标题"),
                ),
                margin: const EdgeInsets.all(16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
