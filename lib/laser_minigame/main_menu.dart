import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/gameplay.dart';

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
                        padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                        child: Text(
                          "Oh no!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: "Eordeoghlakat"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          "You got out of prison, but the guards saw. Dodge their lasers while getting to the other side to keep the maximum number of points!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: "Good Timing"),
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
                style: ButtonStyle(
                    alignment: const Alignment(0, 0),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.blue),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Play',
                    style: TextStyle(fontSize: 25, fontFamily: "Eordeoghlakat"),
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
