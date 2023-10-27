import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/laser_game.dart';
import 'package:flame/game.dart';

LaserGame _laserGame = LaserGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _laserGame,
    );
  }
}
