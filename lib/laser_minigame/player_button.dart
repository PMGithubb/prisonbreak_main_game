// import 'package:flame/events.dart';
// import 'package:flutter/material.dart';

// // class PlayerButton extends StatefulWidget {
// //   const PlayerButton({super.key});

// //   @override
// //   PlayerButtonState createState() => PlayerButtonState();
// // }

// // class PlayerButtonState extends State<PlayerButton> {
// //   int xPosition = 80;
// //   @override
// //   Widget build(BuildContext context) {
// //     return (ElevatedButton(
// //       child: const Image(
// //           image:
// //               AssetImage('assets/images/square_buttons/NextSquareButton.png')),
// //       onPressed: () {
// //         setState(() {
// //           xPosition += 5;
// //         });
// //       },
// //     ));
// //   }
// // }

// class PlayerButton extends PositionComponent with TapCallbacks {
//   PlayerButton() : super(size: Vector2(80, 60));

//   @override
//   void onTapUp(TapUpEvent event) {
//     // Do something in response to a tap event
//   }
// }
