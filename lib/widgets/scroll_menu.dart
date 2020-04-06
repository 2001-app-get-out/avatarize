import 'package:flutter/material.dart';
import 'package:test_flutter/store/filter.dart';
import '../store/edited_image.dart';
import 'package:get_it/get_it.dart';
import 'save.dart';
import '../store/filter.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Center(child: MenuWidget()),
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
    SubMenuWidget(),
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

class SubMenuWidget extends StatefulWidget {
   SubMenuWidget({Key key}) : super(key: key);

  @override
  _SubMenuWidgetState createState() => _SubMenuWidgetState();
  }


class _SubMenuWidgetState extends State<SubMenuWidget> {

 var image = GetIt.I<EditedImage>();

 int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    static List _filterOptions = [
    Grayscale(),
    Sepia(),
    Pixelate(),
    Fill(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    image.filter = _filterOptions.elementAt(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.collections,
                 color: Colors.grey),
                 title: Text('Grayscale'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections,
                 color: Colors.brown),
                 title: Text('Sepia'),
          ),
                 BottomNavigationBarItem(
            icon: Icon(Icons.collections,
                 color: Colors.black),
                 title: Text('Pixelate'),
          ),
                 BottomNavigationBarItem(
            icon: Icon(Icons.collections,
                 color: Colors.green),
                 title: Text('Fill'),
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


// class FilterSubMenuWidget extends StatefulWidget {
//   FilterSubMenuWidget({Key key}) : super(key: key);

//   @override
//   _FilterSubMenuWidgetState createState() => _FilterSubMenuWidgetState();
//   }

// class _FilterSubMenuWidgetState extends State<FilterSubMenuWidget> {

//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static List<Widget> _widgetOptions = <Widget>[
//     FilterSubMenuWidget(),
//     Text(
//       'Crop',
//       style: optionStyle,
//     ),
//     Text(
//       'Stickers coming soon',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.collections,
//                  color: Colors.grey),
//             title: Text('Grayscale')
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.collections,
//              color: Colors.brown),
//             title: Text('Sepia'),
//           ),
//         ],
//         selectedItemColor: Colors.blue[800],
//       ),
//     );
//   }
// }



  