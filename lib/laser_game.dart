import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

class LaserGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await images.loadAll(['prison_yard.png', 'sprite_final.png']);
  }
}
