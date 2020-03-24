import 'package:flutter/material.dart';
import 'widgets/scroll_menu.dart';
import 'widgets/image_picker.dart';

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
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => TestMenu(),
        '/image_picker': (context) => ImagePickerClass(),
        '/scroll_menu': (context) => CircleImages(),
      },
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class TestMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tests Menu")),
      body: Column(
        children: [
          _navButton(
            context,
            text: "scroll menu",
            route: '/scroll_menu',
          ),
          _navButton(
            context,
            text: "image picker",
            route: "/image_picker",
          ),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, {String text, String route}) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("circle"),
      ),
      body: Center(child: CircleImages()),
    );
  }
}
