import 'package:flutter/material.dart';
import 'crop_image.dart';
import 'save.dart';

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
    FilterSubMenuWidget(),
    Text(
      'Choose your crop',
      style: optionStyle,
    ),
    Text(
      'Stickers coming soon',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 1) cropImage();
    if (index == 3) savePng();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: Icon(Icons.collections, color: Colors.grey),
              title: Text('Grayscale')),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections, color: Colors.brown),
            title: Text('Sepia'),
          ),
        ],
        selectedItemColor: Colors.blue[800],
      ),
    );
  }
}
