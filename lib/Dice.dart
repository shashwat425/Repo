import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MyDice extends StatefulWidget {
  @override
  _MyDiceState createState() => _MyDiceState();
}

class _MyDiceState extends State<MyDice> {
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

  int roll1 = 1, roll2 = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Dicee'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {  },
                  child: Image.asset('images/dice/dice$roll1.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {  },
                  child: Image.asset('images/dice/dice$roll2.png'),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          RaisedButton(
            padding: EdgeInsets.all(30.0),
            child: Text('Roll'),
            onPressed: () {
              PlaySound();
              setState(() {
                roll1 = Random().nextInt(6) + 1;
                roll2 = Random().nextInt(6) + 1;
              });
            },
          )
        ],
      )),
    );
  }

  void PlaySound() {
    //final player = AudioCache();
    audioCache.play('/animals/rolling.wav');
  }
}
