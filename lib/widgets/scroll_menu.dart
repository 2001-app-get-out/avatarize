import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../store/filter.dart';
import '../store/edited_image.dart';
import 'save.dart';

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
  Widget _placeholderIcon(String title, IconData icon, dynamic pressAction) {
    return GestureDetector(
      child: Material(
        color: Colors.white,
        child: Center(
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                icon,
                color: Colors.purple,
                size: 30.0,
              ),
              color: Colors.white,
              onPressed: () {
                pressAction();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final image = GetIt.I<EditedImage>();

    List<dynamic> iconList = [
      [
        "save",
        Icons.save,
        () {
          Save().savePng();
          
        }
      ],
      // [
      //   "greyscale",
      //   Icons.monochrome_photos,
      //   image.filter = Grayscale(),
      // ],
      // [
      //   "Pixelate",
      //   Icons.grid_on,
      //   image.filter = Pixelate(),
      // ],
    ];
    List<Widget> widgets = [];
    for (List icon in iconList) {
      widgets.add(_placeholderIcon(icon[0], icon[1], icon[2]));
    }
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
