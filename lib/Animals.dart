//import 'package:audioplayers/audio_cache.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:getflutter/getflutter.dart';
//
//class AnimalSound extends StatefulWidget {
//  @override
//  _AnimalSoundState createState() => _AnimalSoundState();
//}
//
//class _AnimalSoundState extends State<AnimalSound> {
//  Duration _duration = new Duration();
//  Duration _position = new Duration();
//  AudioPlayer advancedPlayer;
//  AudioCache audioCache;
//
//  @override
//  void initState() {
//    super.initState();
//    initPlayer();
//  }
//
//  void initPlayer() {
//    advancedPlayer = new AudioPlayer();
//    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
//
//    // ignore: deprecated_member_use
//    advancedPlayer.durationHandler = (d) => setState(() {
//          _duration = d;
//        });
//
//    // ignore: deprecated_member_use
//    advancedPlayer.positionHandler = (p) => setState(() {
//          _position = p;
//        });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: Colors.blueAccent,
//        appBar: AppBar(
//          title: Text('Animal Sound'),
//        ),
//        body: ListView(
//          children: <Widget>[
//            widgetbuilder(Colors.red, 'bear'),
//            widgetbuilder(Colors.blue, 'cat'),
//            widgetbuilder(Colors.green, 'dog'),
//            widgetbuilder(Colors.yellow, 'horse'),
//            widgetbuilder(Colors.purple, 'monkey'),
//            widgetbuilder(Colors.orange, 'peacock'),
//            //widgetbuilder(Colors.tealAccent, 'rolling'),
//            widgetbuilder(Colors.blueGrey, 'rooster'),
//            widgetbuilder(Colors.brown, 'tiger'),
//          ],
//        ),
//      ),
//    );
//  }
//
//  void PlaySound(String note) {
//    StopSound();
//    audioCache.play('animals/$note.wav');
//  }
//
//  void StopSound() {
//    //AudioPlayer audioPlayer = new AudioPlayer();
//    advancedPlayer.stop();
//  }
//
//  Widget widgetbuilder(Color color, String name) {
//    return GFCard(
//      height: 300,
//      boxFit: BoxFit.cover,
//      imageOverlay: AssetImage('images/animals/$name.jpg'),
//      title: GFListTile(
//        title: Text(
//          '$name',
//          style: TextStyle(
//              fontSize: 30, color: Colors.white, backgroundColor: Colors.black),
//        ),
//      ),
//      content: Text('\n\n\n\n'),
//      buttonBar: GFButtonBar(
//        spacing: 100.0,
//        children: <Widget>[
//          GFButton(
//            onPressed: () => PlaySound(name),
//            text: 'Play',
//            color: Colors.green,
//          ),
//          GFButton(
//            onPressed: () => StopSound(),
//            text: 'Stop',
//            color: Colors.redAccent,
//          ),
//        ],
//      ),
//    );
//  }
//}
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalSound extends StatefulWidget {
  @override
  _AnimalSoundState createState() => _AnimalSoundState();
}

class _AnimalSoundState extends State<AnimalSound> {
  List<String> imgList, AnimalName, AnimalVoice;

  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgList = [
      'bear.jpg',
      'cat.jpg',
      'dog.jpg',
      'horse.jpg',
      'monkey.jpg',
      'peacock.jpg',
      'rooster.jpg',
      'tiger.jpg'
    ];
    AnimalName = [
      'Bear',
      'Cat',
      'Dog',
      'Horse',
      'Monkey',
      'Peacock',
      'Rooster',
      'Tiger'
    ];
    AnimalVoice = [
      'bear.wav',
      'cat.wav',
      'dog.wav',
      'horse.wav',
      'monkey.wav',
      'peacock.wav',
      'rooster.wav',
      'tiger.wav'
    ];

    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
  }

  List<Widget> CardsTemplate() {
    return (imgList
        .map((item) => Builder(builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.lightBlue, Colors.lightGreen],
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset('images/animals/' + item,
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height - 349,
                          width: MediaQuery.of(context).size.width),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          AnimalName[imgList.indexOf(item)],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      color: Colors.black87,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        String voice = AnimalVoice[imgList.indexOf(item)];
                        audioCache.play("animals/" + voice);
                      },
                      label: Text('Voice',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      icon: Icon(Icons.record_voice_over),
                      backgroundColor: Colors.black87,
                      //shape: RoundedRectangleBorder(),
                    ),
                  ],
                ),
              );
            }))
        .toList());
  }

  List<Widget> ScrollListTemplate() {
    return (imgList
        .map((item) => Builder(
              builder: (context) {
                return Container(
                  child: GestureDetector(
                    onTap: () {
                      _controller.animateToPage(imgList.indexOf(item));
                    },
                    child: Image.asset('images/animals/' + item,
                        fit: BoxFit.fill, width: 60),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                );
              },
            ))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Animal Voice';
    return MaterialApp(
        title: title,
        home: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 30,
                    fontStyle: FontStyle.italic),
              ),
              //backgroundColor: Colors.lightGreen,
              centerTitle: true,
            ),
            body: SafeArea(
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.lightBlue, Colors.lightGreen],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      CarouselSlider(
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height - 211,
                            autoPlay: false,
                            //                          aspectRatio: 0.8,
                            //                      viewportFraction: 1.0,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              advancedPlayer.stop();
                            }),
                        items: CardsTemplate(),
                        carouselController: _controller,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: ScrollListTemplate()),
                      )
                    ],
                  )),
            ),
            backgroundColor: Colors.lightGreenAccent,
          );
        }));
  }
}
