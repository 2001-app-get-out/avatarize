import 'package:flutter/material.dart';
// import 'package:test_flutter/store/filter.dart';
// import 'image_editor.dart';
// import '../store/edited_image.dart';
// import 'package:get_it/get_it.dart';

class MyHomePage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Homepage'),
    ),
    body: Center(
      child: MenuWidget()
    ),
  );
}
}

class MenuWidget extends StatefulWidget {
   MenuWidget({Key key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
  }


class _MenuWidgetState extends State<MenuWidget> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    FilterSubMenuWidget(),
    Text(
      'Crop',
      style: optionStyle,
    ),
    Text(
      'Stickers coming soon',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.filter),
            title: Text('Filter'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop),
            title: Text('Crop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_half),
            title: Text('Decoration'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class FilterSubMenuWidget extends StatefulWidget {
  FilterSubMenuWidget({Key key}) : super(key: key);

  @override
  _FilterSubMenuWidgetState createState() => _FilterSubMenuWidgetState();
  }


class _FilterSubMenuWidgetState extends State<FilterSubMenuWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.collections,
                 color: Colors.grey),
            title: Text('Grayscale')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections,
             color: Colors.brown),
            title: Text('Sepia'),
          ),
        ],
        selectedItemColor: Colors.blue[800],
      ),
    );
  }
}

// class FilterSubMenu extends State<MyStatefulWidget> {
//   Widget _grayScale() {
//     return GestureDetector(
//       child: 
//       Material(
//       color: Colors.white,
//       child: Center(
//         child: Ink(
//           decoration: const ShapeDecoration(
//             color: Colors.black,
//             shape: CircleBorder(),
//           ),
//           child: IconButton(
//             icon: Icon(
//               Icons.collections,
//               color: Colors.grey,
//               size: 30.0,
//             ),
//             color: Colors.white,
//             onPressed: () {
//               final snackBar = SnackBar(content: Text("Crop"));
//               Scaffold.of(context).showSnackBar(snackBar);
//             },
//           ),
//         ),
//       ),
//     ),
//     );
//   }

//   Widget _sepia() {
//     return GestureDetector(
//       child: 
//       Material(
//       color: Colors.pink,
//       child: Center(
//         child: Ink(
//           decoration: const ShapeDecoration(
//             color: Colors.purple,
//             shape: CircleBorder(),
//           ),
//           child: IconButton(
//             icon: Icon(
//               Icons.color_lens,
//               color: Colors.red,
//               size: 30.0,
//             ),
//             color: Colors.white,
//             onPressed: () {
//               final snackBar = SnackBar(content: Text("Crop"));
//               Scaffold.of(context).showSnackBar(snackBar);
//             },
//           ),
//         ),
//       ),
//     ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//       List<Widget> widgets = [_grayScale(), _sepia()];
//     return Container(
//       height: 80.0,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.all(2.0),
//         children: widgets,
//       ),
//     );
//   }
// }

// class CircleImages extends StatefulWidget {

//   @override
//   State<StatefulWidget> createState() {
//     return CircleWidgets();
//   }
// }

// class CircleWidgets extends State<CircleImages> {

//   Widget _cropIcon() {
//     return GestureDetector(
//       child: 
//       Material(
//       color: Colors.white,
//       child: Center(
//         child: Ink(
//           decoration: const ShapeDecoration(
//             color: Colors.lightBlue,
//             shape: CircleBorder(),
//           ),
//           child: IconButton(
//             icon: Icon(
//               Icons.crop,
//               color: Colors.purple,
//               size: 30.0,
//             ),
//             color: Colors.white,
//             onPressed: () {
//               EditedImage image = GetIt.I<EditedImage>();
//               image.filter = Grayscale();
//             },
//           ),
//         ),
//       ),
//     ),
//     );
//   }

//   Widget _filterIcon() {
//     return GestureDetector(
//       child: 
//       Material(
//       color: Colors.grey,
//       child: Center(
//         child: Ink(
//           decoration: const ShapeDecoration(
//             color: Colors.white,
//             shape: CircleBorder(),
//           ),
//           child: IconButton(
//             icon: Icon(
//               Icons.collections,
//               color: Colors.grey,
//               size: 30.0,
//             ),
//             color: Colors.white,
//             onPressed: () {
//               EditedImage image = GetIt.I<EditedImage>();
//               image.filter = Grayscale();
//             },
//           ),
//         ),
//       ),
//     ),
//     );
//   }


//   Widget _decorationIcon() {
//     return GestureDetector(
//       child: 
//       Material(
//       color: Colors.brown,
//       child: Center(
//         child: Ink(
//           decoration: const ShapeDecoration(
//             color: Colors.white,
//             shape: CircleBorder(),
//           ),
//           child: IconButton(
//             icon: Icon(
//               Icons.collections,
//               color: Colors.red,
//               size: 30.0,
//             ),
//             color: Colors.white,
//             onPressed: () {
//               EditedImage image = GetIt.I<EditedImage>();
//               image.filter = Sepia();
//             },
//           ),
//         ),
//       ),
//     ),
//     );
//   }


//   @override
//   Widget build(BuildContext context) {

//    List<Widget> widgets = [SizedBox(width: 100), _filterIcon(), SizedBox(width: 100), _cropIcon()];
//     return Container(
//       height: 80.0,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.all(10.0),
//         children: widgets,
//       ),
//     );
//   }
// }


