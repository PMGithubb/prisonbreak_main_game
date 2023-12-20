import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/gameover_menu.dart';
import 'package:prisonbreak_main_game/laser_minigame/pause_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'player.dart';
import 'laser.dart';
import 'background.dart';
import 'package:flame_audio/flame_audio.dart';

class LaserGame extends FlameGame with HasCollisionDetection {
  late Background background;
  late Player player;
  late Laser laser;
  late TextComponent scoreText;
  late TextComponent timeText;
  int score = 100;
  late final SharedPreferences prefs;

  late Timer countDown;
  int remainingTime = 20;
  bool timerStarted = false;

  @override
  Future<void> onLoad() async {
    FlameAudio.bgm.initialize();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("music") ?? true) {
      FlameAudio.bgm.play("background_music.mp3");
    }
    add(background = Background(sprite: await loadSprite('prison_yard.png')));
    add(player = Player(sprite: await loadSprite('sprite_final.png')));
    add(laser = Laser(sprite: await loadSprite('laser.png')));
    score = 100;
    //prefs.setInt("highScore", 0);
    scoreText = TextComponent(
        position: Vector2(550, 40),
        textRenderer: TextPaint(
            style: const TextStyle(
                fontFamily: 'Good Timing',
                fontSize: 25,
                fontWeight: FontWeight.w100)));
    timeText = TextComponent(
        position: Vector2(20, 40),
        textRenderer: TextPaint(
            style: const TextStyle(
                fontFamily: 'Good Timing',
                fontSize: 25,
                fontWeight: FontWeight.w100)));
    add(scoreText);
    add(timeText);
    countDown = Timer(1, onTick: () {
      if (remainingTime > 0) {
        remainingTime -= 1;
      }
    }, repeat: true);
    timerStarted = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreText.text = 'Score: $score';
    timeText.text = 'Time remaining: $remainingTime secs';
    if (remainingTime <= 0) {
      score = 0;
      scoreText.removeFromParent();
      player.removeFromParent();
      player.x = 0;
      overlays.remove(PauseButton.ID);
      overlays.add(GameOverMenu.ID);
    }
    if (player.x >= 780) {
      timeText.removeFromParent();
      scoreText.removeFromParent();
      player.removeFromParent();
      player.x = 0;
      overlays.remove(PauseButton.ID);
      overlays.add(GameOverMenu.ID);
    }

    if (timerStarted && remainingTime > 0) {
      countDown.update(dt);
    }
  }

  void decreaseScore() {
    score -= 10;
    if (prefs.getBool("music") ?? true) {
      FlameAudio.play("laser_hit.mp3");
    }
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
