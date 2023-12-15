import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/summary_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: GamePageView(),
//     );
//   }
// }

class GamePageViewTwo extends StatelessWidget {
  const GamePageViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        GameScreen(
          backgroundImage:
              'assets/images/prison_yard.png', // Replace with the path to your new background image
          characterImage: 'assets/images/sprite_final.png',
          scrollImage: 'assets/images/scroll.png',
          questions: [
            Question(
              question:
                  "I'm a place with walls so thick, where inmates stay so quiet, so quick. Bars surround, but no keys in sight, In the day I'm filled with light. What am I?",
              options: ['Library', 'Prison', 'Classroom', 'Courtyard'],
              correctAnswer: 1,
            ),
            Question(
              question:
                  "I have teeth but never eat, Iron bars, a grim retreat. No windows here, just solitude, Inside my walls, no gratitude. What am I?",
              options: ['Dungeon', 'Cafeteria', 'Jail', 'Museum'],
              correctAnswer: 2,
            ),
            Question(
              question:
                  "Tick tock, goes the clock, Serving time, a heavy dock. In stripes or orange, I am found, In my grasp, freedom's bound. What am I?",
              options: ['Clock', 'Calendar', 'Watchtower', 'Inmate'],
              correctAnswer: 3,
            ),
            Question(
              question:
                  "I stand tall with bars of steel, Watchful eyes, my purpose real. In the night or morning light, I keep watch, out of sight. What am I?",
              options: ['Sentry', 'Guard Tower', 'Warden', 'Fence'],
              correctAnswer: 1,
            ),
            Question(
              question:
                  "Wake up, eat, and then back in, A routine life within. Courtyard, cells, and metal bed, Where am I, its often said. What am I?",
              options: ['Home', 'Prison Yard', 'School', 'Park'],
              correctAnswer: 1,
            ),
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
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
            "LEVEL 2",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
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
                color: Colors.white,
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
        game_score += 20;
        saveScore(game_score);
        return Colors.green;
      } else {
        saveScore(game_score);
        return Colors.red;
      }
    }
    return Colors.white;
  }

  Future<void> saveScore(gameScore) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("levelTwoScore", gameScore);
  }

  void checkAnswer(int selectedOption) {
    setState(() {
      widget.questions[currentQuestionIndex].userAnswer = selectedOption;
      if (selectedOption ==
          widget.questions[currentQuestionIndex].correctAnswer) {
        widget.questions[currentQuestionIndex].isCorrect = true;
      } else if (selectedOption ==
              widget.questions[currentQuestionIndex].correctAnswer &&
          currentQuestionIndex == widget.questions.length - 2) {
        widget.questions[currentQuestionIndex].lastAnswer = true;
      } else {
        widget.questions[currentQuestionIndex].isCorrect = false;
      }

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          // Move to the next question
          if (currentQuestionIndex < widget.questions.length - 1) {
            currentQuestionIndex++;
          } else {
            if (widget.questions[currentQuestionIndex].lastAnswer == true) {
              game_score -= 20;
            }
            // Game Over or show a congratulatory message
            // You can navigate to a new screen or reset the game as per your requirement
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SummaryScreen()));
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
  bool lastAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.userAnswer = -1,
    this.isCorrect = false,
    this.lastAnswer = false,
  });
}
