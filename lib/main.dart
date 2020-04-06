import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


import 'store/edited_image.dart';
import 'widgets/scroll_menu.dart';
import 'widgets/image_picker.dart';
import 'widgets/image_editor.dart';
import 'widgets/stickers.dart';

void main() {
  GetIt.I.registerSingleton<EditedImage>(EditedImage());
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => ImagePickerClass(),
        '/image_picker': (context) => ImagePickerClass(),
        '/image_editor': (context) => ImageEditorPage(),
        '/stickers': (context) => Stickers(),

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
          _navButton(
            context,
            text: "face recognition",
            route: "/face_recognition",
          ),
          _navButton(
            context,
            text: "image editor",
            route: "/image_editor",
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
      body: Center(child: MenuWidget()),
    );
  }
}
