import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  //static AudioCache player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BuildKey(Colors.red, 1),
            BuildKey(Colors.lightGreenAccent, 2),
            BuildKey(Colors.green, 3),
            BuildKey(Colors.yellow, 4),
            BuildKey(Colors.purple, 5),
            BuildKey(Colors.orangeAccent, 6),
            BuildKey(Colors.blueAccent, 7),
          ],
        ),
      ),
    );
  }

  void PlaySound(int number) {
    final player = AudioCache();
    print('TEst');
    player.play('xylophone/note$number.wav');
  }

  Widget BuildKey(Color color, int number) {
    return Expanded(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            // Right Swipe
            //print('drag right');
            PlaySound(number);
            // Sestivity is integer is used when you don't want to mess up vertical drag
          } else if (details.delta.dx < -0) {
            // print('drag down $number');
            PlaySound(number);
            //Left Swipe
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: EdgeInsets.all(10),
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.music_note),
              trailing: Icon(Icons.library_music),
              onTap: () => PlaySound(number),
            ),
          ),
        ),
      ),
    );
  }
}
