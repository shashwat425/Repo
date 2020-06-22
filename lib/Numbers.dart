import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Numbers extends StatefulWidget {
  @override
  _NumbersState createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  int _index = 0;
  int _colorindex = 0;
  List<String> numeric = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  List<String> word = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.greenAccent,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.lightBlueAccent,
    Colors.cyanAccent,
    Colors.brown
  ];

  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    // ignore: deprecated_member_use
    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    // ignore: deprecated_member_use
    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[_index],
      appBar: AppBar(
        title: Text('Numbers'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              numeric[_index],
              style: TextStyle(
                fontSize: 200,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 100),
          Expanded(
            flex: 2,
            child: Text(
              word[_index],
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (_index < 10.0 - 1) {
                        _index++;
                        int number = _index + 1;
                        //print(number);
                        audioCache.play('numbers/$number.wav');
                        // _colorindex = Random().nextInt(10);
                      } else {
                        _index = 0;
                      }
                    });
                  },
                  //color: colors[Random().nextInt(10)],
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                RaisedButton(
                  //color: colors[Random().nextInt(10)],
                  onPressed: () {
                    setState(() {
                      _index = Random().nextInt(10);
                      //print(_index);
                    });
                  },
                  child: Text(
                    'Random',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
