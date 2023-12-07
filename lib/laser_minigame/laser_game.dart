import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:prisonbreak_main_game/laser_minigame/gameover_menu.dart';
import 'package:prisonbreak_main_game/laser_minigame/pause_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:prisonbreak_main_game/pause_menu.dart';
//import 'package:prisonbreak_main_game/laser_minigame/player_button.dart';
import 'player.dart';
import 'laser.dart';
import 'background.dart';

class LaserGame extends FlameGame with HasCollisionDetection {
  late Background background;
  late Player player;
  late Laser laser;
  late TextComponent scoreText;
  int score = 100;
  late final SharedPreferences prefs;

  @override
  Future<void> onLoad() async {
    add(background = Background(sprite: await loadSprite('prison_yard.png')));
    add(player = Player(sprite: await loadSprite('sprite_final.png')));
    add(laser = Laser(sprite: await loadSprite('laser.png')));

    score = 100;
    prefs = await SharedPreferences.getInstance();
    //prefs.setInt("highScore", 0);
    scoreText = TextComponent(position: Vector2(650, 40));
    add(scoreText);
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreText.text = 'Score: $score';
    if (player.x >= 800) {
      player.removeFromParent();
      player.x = 0;
      overlays.remove(PauseButton.ID);
      overlays.add(GameOverMenu.ID);
    }
  }

  void decreaseScore() {
    score -= 20;
  }

  String getScore() {
    return scoreText.text;
  }

  String getHighScore() {
    int highScore = prefs.getInt("highScore") ?? 0;
    if (highScore < score) {
      prefs.setInt("highScore", score);
    }
    return prefs.getInt("highScore").toString();
  }
}
