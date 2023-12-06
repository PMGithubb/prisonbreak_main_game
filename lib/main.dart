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

    ],
    ),
    );
  }
}


class OpeningScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children:[
       Center(
        child: Image.asset("assets/possible_background.png")
      ),
        Center(
          child: SizedBox(
            width: 200,
            height: 200,
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
        )
    ]
    ),
    );
 }}

class successClosingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Center(
            child: Image.asset("assets/images/escape_success.jpg",)
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
          Center(
            child: Text("Try Again.."),
          )
        ]
      ),
    );
  }
}
