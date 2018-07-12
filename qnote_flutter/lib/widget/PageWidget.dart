import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qnote_flutter/model/BlockObject.dart';
import 'package:qnote_flutter/model/NoteContent.dart';
import 'package:qnote_flutter/model/NoteContentSimpleData.dart';
import 'package:qnote_flutter/util/Const.dart';
import 'package:qnote_flutter/value/color.dart';
import 'package:qnote_flutter/value/dimen.dart';

class PageWidget extends StatefulWidget {
  String _noteBookTitle = "";

  PageWidget(this._noteBookTitle);

  @override
  State<StatefulWidget> createState() {
    return new PageWidgetState(_noteBookTitle);
  }
}

class PageWidgetState extends State<PageWidget> {
  bool _editing = false;
  String _noteBookTitle = "";
  DateTime _createTime = DateTime.now();
  DateTime _modifyTime = DateTime.now();
  String _tempJson =
      "{\"blocks\":[{\"key\":\"d5l3p\",\"text\":\"123asdasdasdas23d1as321d856qw4e65wq41651d53as1d8qw4r56qw4f5631asf56a4sf654as5f6a4s56f4as65465\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"9f3dc\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"3vq85\",\"text\":\"xxxx\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"fgknl\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"uhbi\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"dk450\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"13li4\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"3cjrf\",\"text\":\" \",\"type\":\"atomic\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[{\"offset\":0,\"length\":1,\"key\":0}],\"data\":{}},{\"key\":\"e783e\",\"text\":\" \",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"6dsjs\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"6g1l5\",\"text\":\"dsadasd\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}},{\"key\":\"a2oet\",\"text\":\" \",\"type\":\"atomic\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[{\"offset\":0,\"length\":1,\"key\":1}],\"data\":{}},{\"key\":\"dpbis\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{\"0\":{\"type\":\"IMAGE\",\"mutability\":\"IMMUTABLE\",\"data\":{\"url\":\"https://cdn.flutterchina.club/images/flutter-mark-square-100.png\",\"name\":\"QQ20180526-104511@2x.png\",\"type\":\"IMAGE\",\"meta\":{}}},\"1\":{\"type\":\"IMAGE\",\"mutability\":\"IMMUTABLE\",\"data\":{\"url\":\"https://cdn.flutterchina.club/images/flutter-mark-square-100.png\",\"name\":\"QQ20180526-104511@2x.png\",\"type\":\"IMAGE\",\"meta\":{}}}}}";
  List<NoteContentSimpleData> _contentData = [];
  NoteContent _noteContent;
  PageWidgetState(this._noteBookTitle);

  @override
  void initState() {
    super.initState();
    initDataByJson();
  }

  @override
  Widget build(BuildContext context) {
    var df = new DateFormat("yyyy年MM月dd日");
    Widget titleWidget;
    Widget contentListWidget;
    if (!_editing) {
      titleWidget = new Container(
        padding: EdgeInsets.only(top: 45.0, bottom: 10.0),
        color: MyColors.g_bg_light,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new GestureDetector(
                  child: new Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: SizedBox(
                      width: 12.0,
                      height: 18.0,
                      child: new Image.asset('img/ic_gray_arrow_left.png'),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                new Container(
                  child: new Text(
                    _noteBookTitle,
                    style: new TextStyle(
                        color: MyColors.g_text_normal,
                        fontSize: Dimen.g_text_size_huge),
                  ),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 7.0),
                ),
              ],
            ),
            new Container(
              margin: EdgeInsets.only(top: 4.0, left: 31.0, right: 60.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "创建日期：" + df.format(_createTime),
                    style: new TextStyle(
                        color: MyColors.g_text_light,
                        fontSize: Dimen.g_text_size_tiny),
                  ),
                  new Text(
                    "修改日期：" + df.format(_modifyTime),
                    style: new TextStyle(
                        color: MyColors.g_text_light,
                        fontSize: Dimen.g_text_size_tiny),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      contentListWidget = new ListView.builder(
          padding: EdgeInsets.all(0.0),
          itemCount: _contentData.length,
          itemBuilder: (context, position) {
            return _getContentItem(position);
          });
    } else {
      titleWidget = new Container(
        padding: EdgeInsets.only(top: 45.0, bottom: 10.0),
        color: MyColors.g_bg_light,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new GestureDetector(
                          child: new Container(
                            margin: EdgeInsets.only(left: 12.0),
                            child: SizedBox(
                              width: 12.0,
                              height: 18.0,
                              child:
                                  new Image.asset('img/ic_gray_arrow_left.png'),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        new Container(
                          child: new Text(
                            _noteBookTitle,
                            style: new TextStyle(
                                color: MyColors.g_text_normal,
                                fontSize: Dimen.g_text_size_huge),
                          ),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 7.0),
                        ),
                      ],
                    ),
                    new Container(
                      child: new Text(
                        "编辑中",
                        style: new TextStyle(
                            color: MyColors.g_bg_blue,
                            fontSize: Dimen.g_text_size_tiny),
                      ),
                      margin: EdgeInsets.only(left: 2.0),
                    ),
                  ],
                ),
                new GestureDetector(
                  child: new Container(
                    margin: EdgeInsets.only(right: 12.0),
                    child: SizedBox(
                      width: 18.0,
                      height: 18.0,
                      child: new Image.asset('img/ic_sure_gray.png'),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            new Container(
              margin: EdgeInsets.only(top: 4.0, left: 31.0, right: 60.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "创建日期：" + df.format(_createTime),
                    style: new TextStyle(
                        color: MyColors.g_text_light,
                        fontSize: Dimen.g_text_size_tiny),
                  ),
                  new Text(
                    "修改日期：" + df.format(_modifyTime),
                    style: new TextStyle(
                        color: MyColors.g_text_light,
                        fontSize: Dimen.g_text_size_tiny),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      contentListWidget = new ListView.builder(
          padding: EdgeInsets.all(0.0),
          itemCount: _contentData.length,
          itemBuilder: (context, position) {
            return _getEditContentItem(position);
          });
    }
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          titleWidget,
          new Divider(
            height: 0.0,
          ),
          new Flexible(child: contentListWidget),
        ],
      ),
    );
  }

  Widget _getContentItem(int position) {
    Widget child;
    if (_contentData[position].type == Const.CONTENT_TYPE_IMG) {
      child = new SizedBox(
        child: new Image.network(_contentData[position].content),
      );
    } else if (_contentData[position].type == Const.CONTENT_TYPE_TEXT) {
      child = new Text(_contentData[position].content);
    }
    return new InkWell(
      child: new Container(
        padding: new EdgeInsets.only(left: 42.0, right: 42.0),
        child: child,
      ),
      onLongPress: () {
        setState(() {
          _editing = true;
        });
//          BaseUtil.showChooseDialog()
      },
    );
  }

  void initDataByJson() {
    Map contentMap = json.decode(_tempJson);
    NoteContent noteContent = new NoteContent.fromJson(contentMap);
    for (int i = 0; i < noteContent.blocks.length; i++) {
      BlockObject item = noteContent.blocks[i];
      NoteContentSimpleData noteContentSimpleData = new NoteContentSimpleData();
      if (item.entityRanges.length > 0) {
        noteContentSimpleData.type = Const.CONTENT_TYPE_IMG;
        noteContentSimpleData.content = noteContent.entityMap["0"].data.url;
      } else {
        noteContentSimpleData.type = Const.CONTENT_TYPE_TEXT;
        noteContentSimpleData.content = item.text;
      }
      _contentData.add(noteContentSimpleData);
//      noteContent.blocks[i];
    }
  }

  Widget _getEditContentItem(int position) {
    Widget child;
    if (_contentData[position].type == Const.CONTENT_TYPE_IMG) {
      child = new SizedBox(
        child: new Image.network(_contentData[position].content),
      );
    } else if (_contentData[position].type == Const.CONTENT_TYPE_TEXT) {
      child = new Text(_contentData[position].content);
    }

    List<String> longPressSelection = ["复制", "编辑"];
    return new InkWell(
      child: new Container(
        padding: new EdgeInsets.only(left: 42.0, right: 42.0),
        child: new SizedBox(
          height: 100.0,
          child: child,
        ),
      ),
      onLongPress: () {
        setState(() {
          _editing = true;
        });
//          BaseUtil.showChooseDialog()
      },
    );
  }
}
