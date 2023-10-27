import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/gameplay.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100, left: 40, right: 40),
              child: Text(
                "Oh no!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "The prison guards saw you. Dodge their lasers while getting to the other side to keep the maximum number of points!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const GamePlay()));
              },
              style: const ButtonStyle(alignment: Alignment(0, 0)),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Play',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 12, 19, 79),
    );
  }
}
