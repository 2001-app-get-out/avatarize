import 'package:flutter/material.dart';

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
        final snackBar = SnackBar(content: Text("Crop"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
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
               final snackBar = SnackBar(content: Text("Crop"));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    ),
        // Icon(
        // Icons.audiotrack,
        // color: Colors.green,
        // size: 50.0,
        // ),
      //  Container(
      //   height: 60.0,
      //   width: 60.0,
      //   margin: EdgeInsets.all(6.0),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(100.0),
      //     boxShadow: [
      //       new BoxShadow(
      //         color: Color.fromARGB(100, 0, 0, 0),
      //         blurRadius: 5.0,
      //         offset: Offset(5.0, 5.0),
      //       ),
      //     ],
      //     border: Border.all(
      //       width: 2.0,
      //       style: BorderStyle.solid,
      //       color: Color.fromARGB(255, 0, 0, 0),
      //     ),
      //     image: DecorationImage(
      //       fit: BoxFit.cover,
      //       image: musicIcon()
      //       // image: NetworkImage(
      //       //   "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Noto_Emoji_KitKat_263a.svg/1200px-Noto_Emoji_KitKat_263a.svg.png",
      //       ),
      //     ),
      //   ),
      // ),
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
