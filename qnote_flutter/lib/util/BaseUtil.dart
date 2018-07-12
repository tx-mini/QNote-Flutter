import 'package:flutter/material.dart';
import 'package:qnote_flutter/util/CallBack.dart';
import 'package:qnote_flutter/value/color.dart';
import 'package:qnote_flutter/value/dimen.dart';

class BaseUtil {
  static void showChooseDialog(
    List list,
    BuildContext context,
    DialogItemClickCallBack callback,
  ) {
    Widget termListWidget = new ListView.builder(
        padding: new EdgeInsets.all(0.0),
        itemCount: list.length * 2,
        itemBuilder: (context, position) {
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
                    list[position ~/ 2].name,
                    style: new TextStyle(
                        color: MyColors.g_text_normal,
                        fontSize: Dimen.g_text_size_big),
                  )),
              onTap: () {
                callback.onItemClick(position);
              },
            );
          }
        });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(content: termListWidget);
      },
    );
  }
}
