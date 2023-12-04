import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/laser_game.dart';
import 'package:prisonbreak_main_game/laser_minigame/main_menu.dart';

class GameOverMenu extends StatelessWidget {
  static const String ID = 'GameOverMenu';
  final LaserGame gameRef;

  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 10, left: 110, right: 110),
          child: Card(
            color: const Color.fromARGB(190, 0, 0, 0),
            elevation: 50,
            //shadowColor: Color.fromARGB(255, 0, 0, 0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 40),
                  child: Text(
                    "Game Over",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      gameRef.overlays.remove(GameOverMenu.ID);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MainMenu(),
                      ));
                    },
                    style: const ButtonStyle(alignment: Alignment(0, 0)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Restart',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
