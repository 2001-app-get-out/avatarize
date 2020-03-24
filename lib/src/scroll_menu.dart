import 'package:flutter/material.dart';
import 'scanner.dart';

class ScrollMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleWidgets();
  }
}

class CircleWidgets extends State<ScrollMenu> {
  Widget _placeholderIcon() {
    return Container(
      height: 60.0,
      width: 60.0,
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          new BoxShadow(
            color: Color.fromARGB(100, 0, 0, 0),
            blurRadius: 5.0,
            offset: Offset(5.0, 5.0),
          ),
        ],
        border: Border.all(
          width: 2.0,
          style: BorderStyle.solid,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Noto_Emoji_KitKat_263a.svg/1200px-Noto_Emoji_KitKat_263a.svg.png",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List.generate(10, (index) => _placeholderIcon());

<<<<<<< HEAD
    return GestureDetector(
        // When the child is tapped, show a snackbar.
        onTap: () {
          final snackBar = SnackBar(content: Text("Crop"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        // The custom button
        child: Container(
            height: 80.0,
            child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(2.0),
                children: widgets)));
=======
   return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        final snackBar = SnackBar(content: Text("Crop"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      // The custom button
      child: Container(
        height: 80.0,

        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(2.0),
          children: widgets
        )
      )
   );
>>>>>>> e6554cce9bffc263b2d9073a53b6a77bbc12ce11
  }
}
