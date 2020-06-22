import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doodler/Alphabets.dart';
import 'package:doodler/Animals.dart';
import 'package:doodler/Dice.dart';
import 'package:doodler/Numbers.dart';
import 'package:doodler/Xylophone.dart';
import 'package:doodler/Veg.dart';
import 'package:doodler/Flowers.dart';
import 'package:doodler/Fruit.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List<Widget> _children = [
    Xylophone(),
    MyDice(),
    AnimalSound(),
    Numbers(),
    Alphabets(),
    Vegetables(),
    Flowers(),
    Fruits(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.queue_music, size: 30),
          Icon(Icons.gamepad, size: 30),
          Icon(Icons.android, size: 30),
          Icon(Icons.format_list_numbered, size: 30),
          Icon(Icons.format_color_text, size: 30),
          // Icon(Icons.perm_identity, size: 30),
          Icon(Icons.adjust, size: 30),
          Icon(Icons.filter_vintage, size: 30),
          Icon(Icons.ac_unit, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _children[_page],
    );
  }
}
