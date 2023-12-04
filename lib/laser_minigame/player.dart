import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:prisonbreak_main_game/laser_minigame/laser.dart';
import 'package:prisonbreak_main_game/laser_minigame/laser_game.dart';
//import 'package:prisonbreak_main_game/pause_menu.dart';
//import 'package:flutter/services.dart';
//import 'player_button.dart';

class Player extends SpriteComponent
    with HasGameReference<LaserGame>, CollisionCallbacks {
  Player({super.sprite}) {
    size = Vector2(width / 3, height / 3);
    anchor = Anchor.center;
    position = Vector2(450, 250);
    add(RectangleHitbox());
  }

  double x_axisinput = 0;

  @override
  void update(double dt) {
    //7000: implement update
    x = x_axisinput;
    super.update(dt);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Laser) {
      game.decreaseScore();
    }
  }

  void moveRight() {
    //7000: implement update
    x_axisinput += 15;
  }
}
