import 'package:flutter/material.dart';
import 'src/scroll_menu.dart';
import 'src/scanner.dart';

void main() => runApp(MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MyApp(),
        '/$PictureScanner': (BuildContext context) => PictureScanner(),
      },
    ));

/* THIS IS THE ROOT OF THE APP */
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'avatarize',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("avatarize"),
        ),

        bottomNavigationBar: Center(child: ScrollMenu()));
  }
}
