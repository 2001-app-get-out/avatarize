import 'package:flutter/material.dart';
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

  // CircleWidgets({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: Center(
//         child: Ink(
//           decoration: const ShapeDecoration(
//             color: Colors.lightBlue,
//             shape: CircleBorder(),
//           ),
//           child: IconButton(
//             icon: Icon(Icons.android),
//             color: Colors.white,
//             onPressed: () {},
//           ),
//         ),
//       ),
//     );
//   }
// }

  Widget _placeholderIcon() {

    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {

        final snackBar = SnackBar(content: Text("Grayscale"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child:
      Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(
              side: BorderSide(color: Colors.red)
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.crop,
              color: Colors.purple,
              size: 30.0,
            ),
            color: Colors.white,
            onPressed: () {
              // final snackBar = SnackBar(content: Text("Crop"));
              // Scaffold.of(context).showSnackBar(snackBar);
              EditedImage image = GetIt.I<EditedImage>();
              image.filter = Grayscale();
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
