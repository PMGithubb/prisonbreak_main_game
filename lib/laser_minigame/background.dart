import 'package:flame/components.dart';
import 'package:prisonbreak_main_game/laser_minigame/laser_game.dart';

class Background extends SpriteComponent with HasGameRef<LaserGame> {
  Background({super.sprite}) {
    anchor = Anchor.center;
    position = Vector2(380, 196.5);
    size = Vector2(759, 395);
  }
}
