import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/riddles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF5C339B))));

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  late SharedPreferences prefs;
  MyApp({Key? key}) : super(key: key);

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("music", true);
    if (prefs.getBool("music") ?? true) {
      FlameAudio.bgm.initialize();
      FlameAudio.bgm.play("background_music.mp3");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Center(
          child: Image.asset(
        "assets/images/homescreen.jpg",
        height: 1000,
        width: 1000,
      )),
      FutureBuilder(
          future: getPrefs(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(children: [
                Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(
                            top: 20, right: 10, left: 10, bottom: 10),
                        child: Text("Prison Escape",
                            style: TextStyle(
                                fontFamily: "Eordeoghlakat",
                                fontSize: 100,
                                color: Colors.white))),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: 80,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OpeningScreen()));
                          },
                          child: Image.asset(
                            'assets/images/square_buttons/PlaySquareButton.png',
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 70,
                            child: GestureDetector(
                              onTap: () {
                                launchURL();
                              },
                              child: Image.asset(
                                'assets/images/square_buttons/InfoSquareButton.png',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            height: 70,
                            child: GestureDetector(
                              onTap: () {
                                if (prefs.getBool("music") == false) {
                                  FlameAudio.bgm.play("background_music.mp3");
                                  music_setting(true);
                                } else {
                                  FlameAudio.bgm.stop();
                                  music_setting(false);
                                }
                              },
                              child: Image.asset(
                                  "assets/images/square_buttons/MusicSquareButton.png"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]);
            } else {
              return const Text("");
            }
          })
    ]));
  }

  Future<void> music_setting(input) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("music", input);
  }
}

launchURL() async {
  final Uri url =
      Uri.parse('https://sites.google.com/view/prisonbreak-game?usp=sharing');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

var points = 0;

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Center(
          child: FittedBox(
              child: Image.asset("assets/images/possible_background.png",
                  width: screenSize.width, height: screenSize.height)),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
                width: 125,
                height: 125,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const GamePageView()));
                    },
                    child: Image.asset(
                      "assets/images/square_buttons/NextSquareButton.png",
                    )))),
        Positioned(
            right: 560,
            top: 139,
            child: Image.asset(
              "assets/images/sprite_final.png",
              height: 200,
              width: 200,
            )),
        Positioned(
            right: 500,
            top: 20,
            height: 200,
            width: 200,
            child: Image.asset("assets/images/bubble2.png")),
        Positioned(
            right: 100,
            top: 100,
            child: Container(
                padding: const EdgeInsets.all(5),
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: const Text(
                  "There are 2 levels. Level 1 has riddles and a minigame. Level 2 has harder riddles. In each level, try to obtain as many points as possible by answering correctly, and dodging lasers in the minigame. Atleast 200 points must be earned to escape.",
                  style: TextStyle(
                      fontFamily: "Good Timing",
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w100),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ))),
        const Positioned(
            right: 535,
            top: 100,
            child: Text(
              "I need that key...",
              style: TextStyle(
                  fontFamily: 'Good Timing', fontWeight: FontWeight.w100),
            ))
      ]),
    );
  }
}

class successClosingScreen extends StatelessWidget {
  final int score;
  const successClosingScreen({Key? key, required this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(child: Image.asset("assets/images/escape_success.jpg")),
        Positioned(
            right: 310,
            top: 150,
            child: SizedBox(
                width: 130,
                height: 130,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Image.asset(
                        "assets/images/square_buttons/ReturnSquareButton.png")))),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 10),
              child: Text(
                  style: const TextStyle(
                      fontFamily: "Good Timing",
                      fontSize: 40,
                      color: Colors.white),
                  "Score: $score"),
            )),
        const Positioned(
            right: 120,
            top: 50,
            child: Text("You escaped the prison!",
                style: TextStyle(
                    fontFamily: "Eordeoghlakat",
                    fontSize: 62,
                    color: Colors.white)))
      ]),
    );
  }
}

class failureClosingScreen extends StatelessWidget {
  final int score;
  const failureClosingScreen({Key? key, required this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 10),
              child: Text(
                  style: const TextStyle(
                      fontFamily: "Good Timing",
                      fontSize: 40,
                      color: Colors.black),
                  "Points: $score"),
            )),
        const Align(
          alignment: Alignment.topCenter,
          child: Text("Try Again..",
              style: TextStyle(fontFamily: "Eordeoghlakat", fontSize: 100)),
        ),
        Align(
            child: SizedBox(
                width: 120,
                height: 120,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Image.asset(
                        "assets/images/square_buttons/ReturnSquareButton.png")))),
      ]),
    );
  }
}
