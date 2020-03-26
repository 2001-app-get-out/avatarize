import 'package:flutter/material.dart';
import 'image_editor.dart';
import 'edited_image.dart';

class MyHomePage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Homepage'),
    ),
    body: Center(
      child: CircleImages()
    ),
  );
}
}

class CircleImages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleWidgets();
  }
}


class CircleWidgets extends State<CircleImages> {
  Widget _placeholderIcon() {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      // onTap: () {
      //   final snackBar = SnackBar(content: Text("Crop"));
      //   Scaffold.of(context).showSnackBar(snackBar);
      // },
      child: 
      Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.crop,
              color: Colors.purple,
              size: 30.0,
            ),
            color: Colors.white,
            onPressed: () {
              EditedImage image = GetIt.I<EditedImage>();
              //  final snackBar = SnackBar(content: Text("Crop"));
              // Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List.generate(20, (index) => _placeholderIcon());
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(2.0),
        children: widgets,
      ),
    );
  }
}


class SubMenu extends State<CircleImages> {
  Widget _placeholderIcon() {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      // onTap: () {
      //   final snackBar = SnackBar(content: Text("Submenu"));
      //   Scaffold.of(context).showSnackBar(snackBar);
      // },
      child: 
      Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.green,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.crop,
              color: Colors.yellow,
              size: 30.0,
            ),
            color: Colors.white,
            onPressed: () {
              final snackBar = SnackBar(content: Text("Crop"));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List.generate(3, (index) => _placeholderIcon());
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(2.0),
        children: widgets,
      ),
    );
  }
}