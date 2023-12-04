import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/gameover_menu.dart';
import 'package:prisonbreak_main_game/pause_button.dart';
import 'package:prisonbreak_main_game/laser_minigame/laser_game.dart';
import 'package:flame/game.dart';
import 'package:prisonbreak_main_game/laser_minigame/player_button.dart';
import 'package:prisonbreak_main_game/pause_menu.dart';

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LaserGame laserGame = LaserGame();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          GameWidget(
            game: laserGame,
            initialActiveOverlays: const [PauseButton.ID],
            overlayBuilderMap: {
              GameOverMenu.ID: (BuildContext context, LaserGame gameRef) =>
                  GameOverMenu(
                    gameRef: laserGame,
                  ),
              PauseButton.ID: (BuildContext context, LaserGame gameRef) =>
                  PauseButton(
                    gameRef: laserGame,
                  ),
              PauseMenu.ID: (BuildContext context, LaserGame gameRef) =>
                  PauseMenu(
                    gameRef: laserGame,
                  )
            },
          ),
          PlayerButton(game: laserGame),
        ],
      ),
    );
  }
}
