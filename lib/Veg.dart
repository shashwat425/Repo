import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Vegetables extends StatefulWidget {
  @override
  _VegetablesState createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  List<String> Word, Images;
  FlutterTts flutterTts;
  final CarouselController _controller = CarouselController();

  void setTts() async {
    flutterTts = FlutterTts();
    await flutterTts.isLanguageAvailable("en-US");
    await flutterTts.setSpeechRate(0.8);


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setTts();

    Word = [

      'Beetroot',
      'Broccoli',
      'Cabbage',
      'Capsicum',
      'Carrot',
      'Cauliflower',
      'Chilli',
      'Coriander',
      'Cucumber',
      'Garlic',
      'Onion',
      'Peas',
      'Tomato',
      'Turnip',
    ];
    Images = [

      'Beetroot.jpg',
      'Broccoli.jpg',
      'Cabbage.jpg',
      'Capsicum.jpg',
      'Carrot.jpg',
      'Cauliflower.jpg',
      'Chilli.jpg',
      'Coriander.jpg',
      'Cucumber.jpg',
      'Garlic.jpg',
      'Onion.jpg',
      'Peas.jpg',
      'Tomato.jpg',
      'Turnip.jpg',
    ];
  }

  Future _speak(text) async {
    await flutterTts.speak(text);
  }

  Future _stop() async {
    await flutterTts.stop();
  }

  List<Widget> CardsTemplate() {
    return (Images.map((item) =>
        Builder(builder: (context) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'images/vegetable/' + item,
                        ),
                      ),
                    ]),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 349,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Center(
                    child: Text(
                      Word[Images.indexOf(item)],
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
                    _speak(Word[Images.indexOf(item)]);           ////////////////
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
    return (Images
        .map((item) =>
        Builder(
          builder: (context) {
            return Container(
              child: GestureDetector(
                onTap: () {
                  _controller.animateToPage(Images.indexOf(item));
                },
                child: Image.asset('images/vegetable/' + item,
                    fit: BoxFit.fill,
                    width: 60,
                    height:60,
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 5),
            );
          },
        ))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    final title = ' Vegetables';
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
             // backgroundColor: Colors.blueAccent,
              centerTitle: true,
            ),
            body: SafeArea(
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.red, Colors.indigoAccent.shade100, Colors.green],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      CarouselSlider(
                        options: CarouselOptions(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height - 211,
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
                            children: ScrollListTemplate()
                        ),
                      )
                    ],
                  )),
            ),

          );
        }));
  }
}
