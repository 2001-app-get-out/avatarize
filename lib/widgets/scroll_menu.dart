import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter/store/edited_image.dart';

import 'crop_image.dart';
import 'save.dart';
import '../store/filter.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({Key key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    if (index == 0) SubMenuWidget();
    if (index == 1) cropImage();
    if (index == 2) Navigator.pushNamed(context, '/stickers');
    if (index == 3) savePng();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (child: SubMenuWidget()),
      bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            title: Text('Save'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.deepPurple,
        backgroundColor: Colors.grey,
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
    null,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _selectedIndex = index;
    image.filter = _filterOptions.elementAt(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            title: Text('Grayscale'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            title: Text('Sepia'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_on, color: Colors.black),
            title: Text('Pixelate'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.not_interested, color: Colors.red.shade900),
            title: Text('None'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.deepPurple,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
