import 'package:flutter/material.dart';
import 'package:qnote_flutter/value/color.dart';
import 'package:qnote_flutter/value/dimen.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => new _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title),
//      ),
        body: new Stack(
      children: <Widget>[
        new OverflowBox(
            maxWidth: double.infinity,
            maxHeight: double.infinity,
            alignment: Alignment.center,
            child: new FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                child:
                    new Container(child: new Image.asset('img/login_bg.png')))),
        new Container(
          margin: EdgeInsets.only(bottom: 80.0),
          child: new Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: new Material(
              borderRadius: BorderRadius.circular(20.0),
              child: new MaterialButton(
                onPressed: () {
                  doLogin();
                },
                minWidth: 160.0,
                color: MyColors.g_btn_login_bg,
                child: new Text(
                  '使用QQ登陆',
                  style: new TextStyle(
                      color: MyColors.g_text_normal,
                      fontSize: Dimen.g_text_size_huge),
                ),
              ),
            ),
          ),
        ),
        new Align(
          alignment: AlignmentDirectional.center,
          child: new SizedBox(
            width: 280.0,
            height: 325.0,
            child: new Image.asset('img/login_guide_1.png'),
          ),
        )
      ],
    ));
  }

  void doLogin() {
    Navigator.pushNamed(context, '/index');
  }
}
