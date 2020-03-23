import 'package:flutter/material.dart';

class ScrollMenu extends StatelessWidget {
  Widget _placeholderIcon() {
    return Container(
      height: 60.0,
      width: 60.0,
      margin: EdgeInsets.all(6.0),
      child: Icon(Icons.photo_library),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets =
        new List.generate(10, (index) => _placeholderIcon());

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
