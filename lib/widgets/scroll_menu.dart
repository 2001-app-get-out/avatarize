import 'package:flutter/material.dart';
import 'package:test_flutter/store/filter.dart';
import 'image_editor.dart';
import '../store/edited_image.dart';
import 'package:get_it/get_it.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Center(child: CircleImages()),
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
  Widget _cropIcon() {
    return GestureDetector(
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
              image.filter = Grayscale();
            },
          ),
        ),
      ),
    ),
    );
  }

Widget _grayScaleIcon() {
    return GestureDetector(
      child:
      Material(
      color: Colors.grey,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.collections,
              color: Colors.grey,
              size: 30.0,
            ),
            color: Colors.white,
            onPressed: () {
              EditedImage image = GetIt.I<EditedImage>();
              image.filter = Grayscale();
            },
          ),
        ),
      ),
    ),
    );
  }

  Widget _sepiaIcon() {
    return GestureDetector(
      child:
      Material(
      color: Colors.brown,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.collections,
              color: Colors.brown,
              size: 30.0,
            ),
            color: Colors.white,
            onPressed: () {
              EditedImage image = GetIt.I<EditedImage>();
              image.filter = Sepia();
            },
          ),
        ),
      ),
    ),
    );
  }


  @override
  Widget build(BuildContext context) {
   List<Widget> widgets = [SizedBox(width: 100), _sepiaIcon(), SizedBox(width: 100), _grayScaleIcon()];
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10.0),
        children: widgets,
      ),
    );
  }
}


class FilterSubMenu extends State<CircleImages> {
  Widget _grayScale() {
    return GestureDetector(
      child:
      Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.black,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.collections,
              color: Colors.grey,
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

  Widget _sepia() {
    return GestureDetector(
      child:
      Material(
      color: Colors.pink,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.purple,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.color_lens,
              color: Colors.red,
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
      List<Widget> widgets = [_grayScale(), _sepia()];
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
