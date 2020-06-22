import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Alphabets extends StatefulWidget {
  @override
  _AlphabetsState createState() => _AlphabetsState();
}

class _AlphabetsState extends State<Alphabets> {
  List<String> Alphabet, Word, Images;
  FlutterTts flutterTts;
  final CarouselController _controller = CarouselController();

  void setTts() async {
    flutterTts = FlutterTts();
    await flutterTts.isLanguageAvailable("en-US");
    await flutterTts.setSpeechRate(0.4);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setTts();

    Alphabet = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];
    Word = [
      'Apple',
      'Ball',
      'Cat',
      'Dog',
      'Egg',
      'Fan',
      'Grapes',
      'Hat',
      'Iron',
      'Jug',
      'Kite',
      'Lemon',
      'Mouse',
      'Nest',
      'Orange',
      'Parrot',
      'Quiz',
      'River',
      'Sugar',
      'Telephone',
      'Umbrella',
      'Violin',
      'Watch',
      'Xylophone',
      'Yak',
      'Zebra'
    ];
    Images = [
      'apple.jpg',
      'ball.jpg',
      'cat.jpg',
      'dog.jpg',
      'egg.jpg',
      'fan.jpg',
      'grapes.jpg',
      'hat.jpg',
      'iron.jpg',
      'jug.jpg',
      'kite.jpg',
      'lemon.jpg',
      'mouse.jpg',
      'nest.jpg',
      'orange.jpg',
      'parrot.jpg',
      'quiz.jpg',
      'river.jpg',
      'sugar.jpg',
      'telephone.jpg',
      'umbrella.jpg',
      'violin.jpg',
      'watch.jpg',
      'xylophone.jpg',
      'yak.jpg',
      'zebra.jpg'
    ];
  }

  Future _speak(text) async {
    await flutterTts.speak(text);
  }

  Future _stop() async {
    await flutterTts.stop();
  }

  List<Widget> CardsTemplate() {
    return (Alphabet.map((item) => Builder(builder: (context) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(children: <Widget>[
                      Text(
                        item + "  " + item.toLowerCase(),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "for",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 40.0,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'images/alphabets/' + Images[Alphabet.indexOf(item)],
                        ),
                      ),
                    ]),
                    height: MediaQuery.of(context).size.height - 349,
                    width: MediaQuery.of(context).size.width,
//                  color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Center(
                    child: Text(
                      Word[Alphabet.indexOf(item)],
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
                    _speak(item + " for " + Word[Alphabet.indexOf(item)]);
                  },
                  label: Text('Spell',
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
        })).toList());
  }

  List<Widget> ScrollListTemplate() {
    return (Alphabet.map((item) => Builder(
          builder: (context) {
            return Container(
              child: GestureDetector(
                onTap: () {
                  _controller.animateToPage(Alphabet.indexOf(item));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 41,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  color: Colors.white,
                  width: 60,
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 5),
            );
          },
        )).toList());
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Alphabets';
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
                      colors: [Colors.green, Colors.yellow],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      CarouselSlider(
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height - 211,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              _stop();
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
