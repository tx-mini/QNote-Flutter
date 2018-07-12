import 'package:flutter/material.dart';
import 'package:qnote_flutter/widget/IndexWidget.dart';
import 'package:qnote_flutter/widget/LoginWidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginWidget(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginWidget(),
        '/index': (BuildContext context) => new IndexWidget(),
      },
    );
  }
}
