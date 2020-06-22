import 'package:doodler/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:doodler/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiiiii!! Doodle'),
      ),
      //bottomNavigationBar: BottomNavBar(),
      //body: Xylophone(),
      drawer:MainDrawer(),
    );
  }
}
