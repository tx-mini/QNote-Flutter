import 'package:flutter/material.dart';
import 'package:qnote_flutter/model/NoteSimpleData.dart';
import 'package:qnote_flutter/model/PageSimpleData.dart';
import 'package:qnote_flutter/model/TermSimpleData.dart';
import 'package:qnote_flutter/value/color.dart';
import 'package:qnote_flutter/value/dimen.dart';
import 'package:qnote_flutter/widget/PageWidget.dart';

class IndexWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new IndexWidgetState();
  }
}

class IndexWidgetState extends State<StatefulWidget> {
  String _termText = "2018-2019学年上";
  String _noteText = "软件质量保证";
  String _name = "用户名";
  List<PageSimpleDate> _pageList = [];
  List<NoteSimpleData> _noteList = [];
  List<TermSimpleData> _termList = [];
  int currNoteIndex = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      _pageList.add(new PageSimpleDate("2018-7-6笔记" + i.toString(),
          new DateTime.fromMillisecondsSinceEpoch(1531282316 * 1000)));
      _noteList.add(new NoteSimpleData("第" + i.toString() + "本笔记"));
      _termList.add(new TermSimpleData("第" + i.toString() + "学年上学期"));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = new Container(
      padding: EdgeInsets.only(top: 45.0, bottom: 10.0),
      color: MyColors.g_bg_light,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            child: new Text(
              _termText,
              style: new TextStyle(
                  color: MyColors.g_text_normal,
                  fontSize: Dimen.g_text_size_normal),
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 18.0),
          ),
          new Container(
            margin: EdgeInsets.only(top: 4.0, left: 18.0, right: 18.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  _noteText,
                  style: new TextStyle(
                      color: MyColors.g_text_normal,
                      fontSize: Dimen.g_text_size_huge),
                ),
                new SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: new Image.asset("img/ic_add_note.png"),
                )
              ],
            ),
          )
        ],
      ),
    );

    Widget pageListWidget = new ListView.builder(
        padding: new EdgeInsets.all(0.0),
        itemCount: _pageList.length * 2,
        itemBuilder: (context, position) {
          return _getPageView(position);
        });

    Widget noteListWidget = new ListView.builder(
        padding: new EdgeInsets.all(0.0),
        itemCount: _noteList.length,
        itemBuilder: (context, position) {
          return _getNoteView(position);
        });

    Widget drawerWidget = new Drawer(
      child: Column(
        children: <Widget>[
          new Container(
              padding: new EdgeInsets.only(top: 45.0, bottom: 21.0),
              color: MyColors.g_bg_blue,
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: new CircleAvatar(
                      child: new Image.network(
                        "https://cdn.flutterchina.club/images/flutter-mark-square-100.png",
                        fit: BoxFit.scaleDown,
                      ),
                      backgroundColor: Colors.transparent,
//                    backgroundImage: NetworkImage(
//                        "https://cdn.flutterchina.club/images/flutter-mark-square-100.png",
//                        scale: 2.0),
                    ),
                    width: 55.0,
                    height: 55.0,
                  ),
                  new Text(
                    _name,
                    style: new TextStyle(
                        fontSize: Dimen.g_text_size_huge, color: Colors.white),
                  ),
                ],
              )),
          new InkWell(
            child: new Container(
              padding: new EdgeInsets.only(top: 9.0, bottom: 9.0, left: 14.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    _termText,
                    style: new TextStyle(
                        color: MyColors.g_text_normal,
                        fontSize: Dimen.g_text_size_big),
                  ),
                  new Container(
                    margin: new EdgeInsets.only(left: 9.0),
                    child: new SizedBox(
                      width: 8.0,
                      height: 13.0,
                      child: new Image.asset("img/ic_gray_arrow_right.png"),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              _chooseTerm();
            },
          ),
          new Divider(
            height: 0.0,
          ),
          new Flexible(child: noteListWidget),
          new Divider(
            height: 0.0,
          ),
          new Container(
              color: MyColors.g_bg_light,
              height: 45.0,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new SizedBox(
                          width: 18.0,
                          height: 18.0,
                          child: new Image.asset("img/ic_setting.png"),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 2.0),
                          child: new Text("设置课表"),
                        )
                      ],
                    ),
                  ),
                  new Expanded(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new SizedBox(
                          width: 18.0,
                          height: 18.0,
                          child: new Image.asset("img/ic_dustbin.png"),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 2.0),
                          child: new Text("垃圾桶"),
                        )
                      ],
                    ),
                  ),
                  new Divider(
                    height: 0.0,
                  ),
                  new Expanded(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new SizedBox(
                          width: 18.0,
                          height: 18.0,
                          child: new Image.asset("img/ic_study.png"),
                        ),
                        new Container(
                          margin: new EdgeInsets.only(left: 2.0),
                          child: new Text("学习园地"),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );

    return new Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          titleWidget,
          new Divider(
            height: 0.0,
          ),
          new Flexible(child: pageListWidget)
        ],
      ),
      drawer: drawerWidget,
    );
  }

  Widget _getPageView(int position) {
    if (position % 2 != 0) {
      return new Divider(
        height: 0.0,
      );
    } else {
      Widget pageName = new Container(
        margin: EdgeInsets.only(left: 16.0),
        alignment: Alignment.center,
        child: new Text(
          _pageList[position ~/ 2].name,
          style: new TextStyle(
              color: MyColors.g_text_normal,
              fontSize: Dimen.g_text_size_normal),
        ),
      );
      Widget pageEditTime = new Container(
        margin: EdgeInsets.only(right: 16.0),
        alignment: Alignment.center,
        child: new Text(
          _pageList[position ~/ 2].dateTime.toString(),
          style: new TextStyle(
              color: MyColors.g_text_light, fontSize: Dimen.g_text_size_small),
        ),
      );
      return new InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              pageName,
              pageEditTime,
            ],
          ),
        ),
        onTap: () {
          _onPageItemClick(position);
        },
      );
    }
  }

  _onPageItemClick(int position) {
//    Navigator.pushNamed(context, '/page');
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
      return new PageWidget(_pageList[position ~/ 2].name);
    }));
  }

  Widget _getNoteView(int position) {
    Widget noteName = new Container(
      margin: EdgeInsets.only(left: 3.0),
      alignment: Alignment.center,
      child: new Text(
        _noteList[position].name,
        style: new TextStyle(
            color: MyColors.g_text_normal, fontSize: Dimen.g_text_size_normal),
      ),
    );

    return new InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 26.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new SizedBox(
              width: 20.0,
              height: 20.0,
              child: new Image.asset('img/ic_note.png'),
            ),
            noteName,
          ],
        ),
      ),
      onTap: () {
        _onNoteItemClick(position);
      },
    );
  }

  _onNoteItemClick(int position) {
    currNoteIndex = position;
    Navigator.pop(context);
  }

  void _chooseTerm() {
    Widget termListWidget = new ListView.builder(
        padding: new EdgeInsets.all(0.0),
        itemCount: _termList.length * 2,
        itemBuilder: (context, position) {
          return _getTermView(position);
        });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(content: termListWidget);
      },
    );
  }

  Widget _getTermView(int position) {
    if (position % 2 != 0) {
      return new Divider(
        height: 0.0,
      );
    } else {
      return new InkWell(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Text(
              _termList[position ~/ 2].name,
              style: new TextStyle(
                  color: MyColors.g_text_normal,
                  fontSize: Dimen.g_text_size_big),
            )),
        onTap: () {
          _onPageItemClick(position);
        },
      );
    }
  }
}
