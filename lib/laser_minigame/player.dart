import 'package:flame/components.dart';

class Player extends SpriteComponent with KeyboardHandler, HasGameRef {
  Player({super.sprite}) {
    size = Vector2(width / 3, height / 3);
    anchor = Anchor.center;
    position = Vector2(100, 250);
  }
  // var x_axisinput = 0.0;

  // @override
  // void update(double dt) {
  //   //7000: implement update
  //   x += x_axisinput;
  //   super.update(dt);
  // }

  // @override
  // //change to if button pressed
  // bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
  //   x_axisinput = 0.0;
  //   if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
  //     x_axisinput += -10.0;
  //   }
  //   return true;
  // }

  //add moveButton method
}
