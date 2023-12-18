import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/main_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamePageView extends StatelessWidget {
  const GamePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        GameScreen(
          backgroundImage: 'assets/images/initial_cell.png',
          characterImage: 'assets/images/sprite_final.png',
          scrollImage: 'assets/images/scroll.png',
          questions: [
            Question(
              question: "What has many keys but can't unlock a single door?",
              options: ['Piano', 'Jailor', 'Handcuffs', 'Map'],
              correctAnswer: 0,
            ),
            Question(
              question: "I am made of bars, yet I'm not a prison. What am I?",
              options: ['Playground', 'Chocolate Bar', 'Jail Cell', 'Bicycle'],
              correctAnswer: 1,
            ),
            Question(
              question: "I can be cracked, made, told, and played. What am I?",
              options: ['Joke', 'Prison Guard', 'Riddle', 'Code'],
              correctAnswer: 2,
            ),
            Question(
              question:
                  "What comes once in a minute, twice in a moment, but never in a thousand years?",
              options: [
                'The word "escape"',
                'The letter "M"',
                'Prison Sentence',
                'Prison Break'
              ],
              correctAnswer: 1,
            ),
            Question(
              question:
                  "I can fly without wings, cry without eyes. Wherever I go, darkness dies, What am I?",
              options: ['A Bat', 'A Bird', 'A Flashlight', 'A Jail Break Plan'],
              correctAnswer: 2,
            )
          ],
        ),
        // Add more GameScreen pages as needed
      ],
    );
  }
}

class GameScreen extends StatefulWidget {
  final String backgroundImage;
  final String characterImage;
  final String scrollImage;
  final List<Question> questions;

  GameScreen({
    super.key,
    required this.backgroundImage,
    required this.characterImage,
    required this.scrollImage,
    required this.questions,
  });

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  int currentQuestionIndex = 0;
  int game_score = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Image.asset(
          widget.backgroundImage,
          width: 850,
          height: 395,
        ),

        // Character at bottom left
        Positioned(
            left: 16,
            bottom: 16,
            child: Image.asset(widget.characterImage, width: 450, height: 250)),

        // Scroll Image
        // Positioned(
        //   top: 16,
        //   right: 16,
        //   child: Image.asset(
        //     widget.scrollImage,
        //     height: 200,
        //   ),
        // ),

        // Question and Options
        Positioned(
          top: 32,
          right: 32,
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/scroll.png"),
                  fit: BoxFit.fill),
              color: const Color.fromARGB(0, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: 0.0,
                          minHeight: 0.0,
                          maxHeight: double.infinity,
                          maxWidth: 250),
                      child: Text(
                        widget.questions[currentQuestionIndex].question,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Good Timing',
                          color: Colors.black,
                          decorationColor: Color.fromARGB(0, 0, 0, 0),
                          backgroundColor: Color.fromARGB(0, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Options
                Column(
                  children: List.generate(
                    widget.questions[currentQuestionIndex].options.length,
                    (index) => GestureDetector(
                      onTap: () => checkAnswer(index),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                              color: _getOptionColor(index),
                            ),
                            child: Text(
                                widget.questions[currentQuestionIndex]
                                    .options[index],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Good Timing",
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 30,
          left: 80,
          child: Text(
            "LEVEL 1",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 30,
                fontFamily: "Eordeoghlakat",
                backgroundColor: Color.fromARGB(0, 0, 0, 0),
                decorationColor: Color.fromARGB(0, 0, 0, 0)),
          ),
        ),
        Positioned(
          top: 70,
          left: 80,
          child: Text(
            "Score: $game_score",
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: "Good Timing",
                backgroundColor: Color.fromARGB(0, 0, 0, 0),
                decorationColor: Color.fromARGB(0, 0, 0, 0)),
          ),
        )
      ],
    );
  }

  Color _getOptionColor(int index) {
    if (widget.questions[currentQuestionIndex].userAnswer == index) {
      if (widget.questions[currentQuestionIndex].isCorrect) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }
    return Colors.white;
  }

  Future<void> saveScore(gameScore) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("levelOneScore", gameScore);
  }

  int getScore() {
    return game_score;
  }

  void checkAnswer(int selectedOption) {
    setState(() {
      widget.questions[currentQuestionIndex].userAnswer = selectedOption;
      if (selectedOption ==
          widget.questions[currentQuestionIndex].correctAnswer) {
        FlameAudio.play("correct_answer.mp3");
        widget.questions[currentQuestionIndex].isCorrect = true;
        game_score += 10;
      } else {
        FlameAudio.play("wrong_answer.mp3");
        widget.questions[currentQuestionIndex].isCorrect = false;
      }
      saveScore(game_score);

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          // Move to the next question
          if (currentQuestionIndex < widget.questions.length - 1) {
            currentQuestionIndex++;
          } else {
            FlameAudio.play("oh_no_screen.mp3");
            // Game Over or show a congratulatory message
            // You can navigate to a new screen or reset the game as per your requirement
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const MainMenu(),
            ));
          }
        });
      });
    });
  }
}

class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;
  int userAnswer;
  bool isCorrect;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.userAnswer = -1,
    this.isCorrect = false,
  });
}
