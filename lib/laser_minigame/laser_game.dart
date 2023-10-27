import 'package:flame/game.dart';
import 'player.dart';
import 'laser.dart';
import 'background.dart';

class LaserGame extends FlameGame {
  late Background background;
  late Player player;
  late Laser laser;

  @override
  Future<void> onLoad() async {
    add(background = Background(sprite: await loadSprite('prison_yard.png')));
    add(player = Player(sprite: await loadSprite('sprite_final.png')));
    add(laser = Laser(sprite: await loadSprite('laser.png')));
  }
}
