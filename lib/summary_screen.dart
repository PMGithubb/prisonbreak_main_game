import 'package:flutter/material.dart';
import 'package:prisonbreak_main_game/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SummaryScreen extends StatelessWidget {
  late SharedPreferences prefs;
  SummaryScreen({Key? key}) : super(key: key);

  // Future<void> getPrefs() async {
  //   SharedPreferences p = await SharedPreferences.getInstance();
  //   prefs = p;
  // }

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    totalScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/prison_yard.png"))),
          child: Column(
            children: [
              FutureBuilder(
                  future: getPrefs(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 10, left: 110, right: 110),
                            child: Card(
                              color: const Color.fromARGB(190, 0, 0, 0),
                              elevation: 50,
                              //shadowColor: Color.fromARGB(255, 0, 0, 0),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 30, left: 40, right: 40),
                                    child: Text(
                                      "Score Summary:",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: "Eordeoghlakat"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0,
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 5.0),
                                    child: Text(
                                      "Level 1 Riddles: ${prefs.getInt('levelOneScore')} / 50",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: "Good Timing"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0,
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 5.0),
                                    child: Text(
                                      "Laser Minigame: ${prefs.getInt('highScore')} / 100",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: "Good Timing"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0,
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 5.0),
                                    child: Text(
                                      "Level 2 Riddles: ${prefs.getInt('levelTwoScore') ?? 0} / 100",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: "Good Timing"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0,
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 5.0),
                                    child: Text(
                                      "Total Score: ${prefs.getInt("totalScore")} / 250",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: "Good Timing"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0,
                                        left: 30.0,
                                        right: 30.0,
                                        bottom: 5.0),
                                    child: Text(
                                      "Percent achieved: ${((prefs.getInt("totalScore") ?? 0.toDouble()) / (250.0)) * 100.0}%",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: "Good Timing"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              int total_score = prefs.getInt("totalScore") ?? 0;
                              if (total_score < 200) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            failureClosingScreen(
                                              score: total_score,
                                            )));
                              } else {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            successClosingScreen(
                                              score: total_score,
                                            )));
                              }
                            },
                            style:
                                const ButtonStyle(alignment: Alignment(0, 0)),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                    fontSize: 25, fontFamily: "Eordeoghlakat"),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Text("");
                    }
                  }),
            ],
          ),
        ),
      ),
      // backgroundColor: const Color.fromARGB(255, 12, 19, 79),
    );
  }

  // Future<int> getScores(keyLabel) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return Future.value(prefs.getInt(keyLabel) ?? 0);
  // }

  // Future<void> setTotalScore(scoreOne, scoreTwo, scoreThree) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt("totalScore", scoreOne + scoreTwo + scoreThree);
  // }

  Future<int> totalScore() async {
    int levelOneScore = prefs.getInt("levelOneScore") ?? 0;
    int levelTwoScore = prefs.getInt("levelTwoScore") ?? 0;
    int highScore = prefs.getInt("highScore") ?? 0;
    int totalScore = levelTwoScore + levelOneScore + highScore;
    prefs.setInt("totalScore", totalScore);
    //setTotalScore(scoreOne, scoreTwo, scoreThree);
    //return scoreOne + scoreTwo + scoreThree;
    return Future.value(totalScore);
  }
}
