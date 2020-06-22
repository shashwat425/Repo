import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doodler/Animals.dart';
import 'package:doodler/Alphabets.dart';
import 'package:doodler/Veg.dart';
import 'package:doodler/Flowers.dart';
import 'package:doodler/Fruit.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              // child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 60,
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                          child: Text(
                            'Doodlerrrr',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              )),
          ListTile(
            leading: Icon(Icons.queue_music, size: 30),
            title: Text(
              'Xylophone',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Alphabets(),
              ));
              //  Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.gamepad, size: 30),
            title: Text(
              'Dicee',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Alphabets(),
                  ));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.android, size: 30),
            title: Text(
              'Animal Voices',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimalSound(),
                  ));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.format_list_numbered, size: 30),
            title: Text(
              'Numbers',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Alphabets(),
                  ));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.format_color_text, size: 30),
            title: Text(
              'Alphabets',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Alphabets(),
                  ));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.adjust, size: 30),
            title: Text(
              'Vegetables',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Vegetables(),
                  ));
              //  Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_vintage, size: 30),
            title: Text(
              'Flowers',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Flowers(),
                  ));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit, size: 30),
            title: Text(
              'Fruits',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Fruits(),
                  ));
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
