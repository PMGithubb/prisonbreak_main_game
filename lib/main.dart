//import 'package:prisonbreak_main_game/laser_minigame/main_menu.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(home: MainMenu()));

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Image.asset(
            "assets/images/homescreen.jpg",
            height: 1000,
            width: 1000,
          )),
          Center(
            child: SizedBox(
              width: 300,
              height: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OpeningScreen()));
                  debugPrint('The image button has been tapped');
                },
                child: Image.asset(
                  'assets/images/square_buttons/PlaySquareButton.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(child: Image.asset("assets/possible_background.png")),
      ]),
    );
  }
}
