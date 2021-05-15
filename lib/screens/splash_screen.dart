// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SplashScreen extends StatefulWidget {
//   final mainColor = Color(0xFF1DB854);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             height: 140,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: widget.mainColor,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black,
//                   offset: Offset(5.0, 5.0),
//                   blurRadius: 20.0,
//                   spreadRadius: 5.0,
//                 ),
//                 BoxShadow(
//                   color: Colors.white.withOpacity(.20),
//                   offset: Offset(-5.0, -5.0),
//                   blurRadius: 20.0,
//                   spreadRadius: 5.0,
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: widget.mainColor,
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: widget.mainColor,
//                       gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomLeft,
//                           colors: [
//                             Color.lerp(widget.mainColor, Colors.black, .1)!,
//                             Color.lerp(widget.mainColor, Colors.black, .09)!,
//                             Color.lerp(widget.mainColor, Colors.black, .05)!,
//                           ],
//                           stops: [
//                             0.0,
//                             .3,
//                             .6,
//                           ]),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(.2),
//                           offset: Offset(-4, -4),
//                           blurRadius: 1.0,
//                         ),
//                         BoxShadow(
//                           color: Colors.white.withOpacity(.2),
//                           offset: Offset(3, 3),
//                           blurRadius: 1.0,
//                         ),
//                       ]),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Stack(
//           children: [
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 height: 120,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Theme.of(context).scaffoldBackgroundColor,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 10.0),
//                 child: Icon(
//                   FontAwesomeIcons.spotify,
//                   size: 140,
//                   color: Color.lerp(widget.mainColor, Colors.black, .065),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
