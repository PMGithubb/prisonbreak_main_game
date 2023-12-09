import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/laser_minigame/main_menu.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: GamePageView(),
//     );
//   }
// }

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
        )
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
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(widget.backgroundImage),

          // Character at bottom left
          Positioned(
              left: 16,
              bottom: 16,
              child:
                  Image.asset(widget.characterImage, width: 450, height: 250)),

          // Scroll Image
          Positioned(
            top: 16,
            right: 16,
            child: Image.asset(
              widget.scrollImage,
              height: 200,
            ),
          ),

          // Question and Options
          Positioned(
            top: 32,
            right: 32,
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question
                    Text(
                      widget.questions[currentQuestionIndex].question,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    // Options
                    Column(
                      children: List.generate(
                        widget.questions[currentQuestionIndex].options.length,
                        (index) => GestureDetector(
                          onTap: () => checkAnswer(index),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                              color: _getOptionColor(index),
                            ),
                            child: Text(
                              widget.questions[currentQuestionIndex]
                                  .options[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              "Score: $game_score",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Color _getOptionColor(int index) {
    if (widget.questions[currentQuestionIndex].userAnswer == index) {
      if (widget.questions[currentQuestionIndex].isCorrect) {
        game_score += 10;
        return Colors.green;
      } else {
        return Colors.red;
      }
    }
    return Colors.white;
  }

  void checkAnswer(int selectedOption) {
    setState(() {
      widget.questions[currentQuestionIndex].userAnswer = selectedOption;
      if (selectedOption ==
          widget.questions[currentQuestionIndex].correctAnswer) {
        widget.questions[currentQuestionIndex].isCorrect = true;
      } else {
        widget.questions[currentQuestionIndex].isCorrect = false;
      }

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          // Move to the next question
          if (currentQuestionIndex < widget.questions.length - 1) {
            currentQuestionIndex++;
          } else {
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
