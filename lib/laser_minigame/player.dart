import 'package:flame/components.dart';
//import 'player_button.dart';

class Player extends SpriteComponent with KeyboardHandler, HasGameRef {
  Player({super.sprite}) {
    size = Vector2(width / 3, height / 3);
    anchor = Anchor.center;
    position = Vector2(100, 250);
  }
  var xAxisinput = 0.0;

  @override
  void update(double dt) {
    //7000: implement update
    x += xAxisinput;
    super.update(dt);
  }
  //var xAxisInput = PlayerButtonState()

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
