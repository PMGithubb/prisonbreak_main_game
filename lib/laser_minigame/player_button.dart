import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/laser_game.dart';

class PlayerButton extends StatelessWidget {
  final LaserGame game;
  const PlayerButton({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
          onPressed: () {
            game.player.moveRight();
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(200.0), // Adjust the border radius
              ),
              fixedSize: const Size(130, 130),
              foregroundColor: const Color.fromARGB(0, 0, 0, 0),
              shadowColor: const Color.fromARGB(0, 0, 0, 0),
              backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
          child:
              Image.asset("assets/images/square_buttons/NextSquareButton.png")),
    );
  }
}
