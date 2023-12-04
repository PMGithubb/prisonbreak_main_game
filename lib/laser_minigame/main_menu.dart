//import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/gameplay.dart';
//import 'package:prisonbreak_main_game/laser_minigame/laser_game.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/prison_yard.png"))),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 10, left: 110, right: 110),
                child: Card(
                  color: Color.fromARGB(190, 0, 0, 0),
                  elevation: 50,
                  //shadowColor: Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50, left: 40, right: 40),
                        child: Text(
                          "Oh no!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                      Padding(
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
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const GamePlay()));
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
      ),
      // backgroundColor: const Color.fromARGB(255, 12, 19, 79),
    );
  }
}
