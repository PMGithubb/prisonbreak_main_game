import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
    MaterialApp(home: MyApp(),
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF5C339B))));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children:[
         Center(
             child: Image.asset(
               "assets/images/homescreen.jpg",
               height:1000,
               width:1000,
             )
         ),
       Center(
        child: SizedBox(
          width: 300,
          height: 100,
        child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpeningScreen()));
        debugPrint('The image button has been tapped');
      },

        child: Image.asset(
          'assets/images/Square Buttons/Play Square Button.png',
        ),
        ),
      ),
    ),
    Positioned(
      right: 281,
      top: 50,
      child: Text(
        "Prison Escape",
        style: TextStyle(fontSize: 50, color: Colors.white)
      )
    )
    ],
    ),
    );
  }
}

var points = 0;

class OpeningScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
    body: Stack(
      children:[
       Center(
         child:FittedBox(
           child: Image.asset("assets/possible_background.png",
             width: width,
            height: height)
    ),
         ),

        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 125,
            height: 125,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => successClosingScreen()));
                },
                child: Image.asset(
                  "assets/images/Square Buttons/Next Square Button.png",
                )
              )
          )
        ),
         Positioned(
          right: 560,
          top: 139,
          child: Image.asset("assets/images/sprite_final.png",
          height: 200,
          width: 200,)
        ),
        Positioned(
          right:500,
          top: 20,
            child: Image.asset("assets/bubble2.png"),
            height:200,
          width:200
        ),
        Positioned(
          right: 100,
          top: 100,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            padding: EdgeInsets.all(5),
            width: 400,
            child: Expanded(
            child: Text(
              "In this game, there are 2 levels. The first level has a question and "
                  "answer section, as well as a minigame. The second section "
                  "has a harder question and answer section compared to the first level. "
                  "In each level, the goal is to obtain as many points as possible "
                  "by answering questions correctly, and playing the minigame. A minimum "
                  "of 100 points must be achieved to successfully obtain the key to "
                  "escape the prison.",
              style: TextStyle(fontSize: 15, color: Colors.white),
              softWrap: true,
              overflow: TextOverflow.visible,
            ))
          )
          ),
        Positioned(
          right:535,
          top:100,
          child: Text("I need to get that key...")
        )
    ]
    ),
    );
 }}

class successClosingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
      body: Stack(
        children:[
          Center(
              child: Image.asset(
                  "assets/images/escape_success.jpg"
              )),

            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
               width: 130,
               height: 130,
               child: GestureDetector(
                onTap: (){
                 Navigator.push(
    context, MaterialPageRoute(builder: (context)=> failureClosingScreen()));
                      },
                  child: Image.asset(
                    "assets/images/Square Buttons/Next Square Button.png",
                  ),
              )
            )
          ),
          Positioned(
            right: 310,
              top: 150,
              child: SizedBox(
                  width: 130,
                  height: 130,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => MyApp()));
                      },
    child: Image.asset(
    "assets/images/Square Buttons/Return Square Button.png"
    ))
              )),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              style: TextStyle(fontSize: 50, color: Colors.white),
              "Points: ${points}"
            )
          ),
          Positioned(
            right:200,
            top:50,
            child: Text(
              "You escaped the prison!",
              style: TextStyle(fontSize: 50, color: Colors.white)
            )
          )
       ]
      ),
    );
  }
}
class failureClosingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children:[
          Positioned(
            right:400,
            top: 50,
            child: Text(
                "Try Again..",
                 style: TextStyle(fontSize: 50)),
          ),
     Center(
        child: SizedBox(
     width: 130,
       height: 130,
         child: GestureDetector(
          onTap: () {
       Navigator.push(
       context, MaterialPageRoute(builder: (context) => MyApp()));
    },
         child: Image.asset("assets/images/Square Buttons/Return Square Button.png")))),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              style: TextStyle(fontSize: 50, color: Colors.white),
              "Points: ${points}"
            )
          )
        ]
      ),
    );
  }
}
