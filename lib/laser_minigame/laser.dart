import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:prisonbreak_main_game/laser_minigame/laser_game.dart';

class Laser extends SpriteComponent with HasGameRef<LaserGame> {
  Laser({super.sprite}) {
    position = Vector2(1500, 250);
    size = Vector2(90, 90);
    add(RectangleHitbox.relative(Vector2(0.1, 1), parentSize: Vector2(90, 90)));
  }

  double acceleration = 0.0;
  double speed = 3.0;
  List coordinatesBin = [
    25.0,
    50.0,
    100.0,
    150.0,
    200.0,
    250.0,
    300.0,
    350.0,
    400.0,
    450.0,
    500.0,
    550.0,
    600.0,
    650.0,
    700.0,
    750.0,
    800.0
  ];

  @override
  void update(double dt) {
    y += speed;
    if (y > 350.0) {
      y = 0;
      x = coordinatesBin.first;
      coordinatesBin.shuffle();
      speed += acceleration;
    }
    // TODO: implement update
    super.update(dt);
  }
}
