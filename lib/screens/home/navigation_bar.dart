import 'package:flutter/material.dart';
import 'package:kramaai/screens/leiding/leiding.dart';
import 'package:kramaai/screens/feed.dart';
import 'package:kramaai/screens/settings/settings.dart';
import 'package:kramaai/shared/constants.dart';
import 'package:kramaai/takken/takken.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Feed(),
    Takken(),
    Leiding(),
    Settings(),
  ];

  void _onItemTapped(int index) {
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
        unselectedItemColor: kThirdColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kSecondaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
