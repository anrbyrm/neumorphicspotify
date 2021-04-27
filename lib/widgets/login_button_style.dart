import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    this.buttonText,
    this.color,
  });

  final String buttonText;
  final Color color;

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    double buttonWidth;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      buttonWidth = MediaQuery.of(context).size.width / 2.7;
    } else {
      buttonWidth = MediaQuery.of(context).size.height / 2.7;
    }
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: buttonWidth,
        height: 55,
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            color: widget.color.withOpacity(.95),
            depth: 5,
            intensity: .3,
            shadowLightColorEmboss: Colors.white,
            shadowDarkColorEmboss: Colors.black,
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.all(Radius.circular(50))),
            lightSource: LightSource.topLeft,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: NeumorphicButton(
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
              onPressed: (() {
                Navigator.of(context).pushNamed('/home');
              }),
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                color: widget.color,
                depth: 1,
                intensity: .1,
                surfaceIntensity: .2,
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(50))),
                lightSource: LightSource.top,
              ),
              child: Center(
                child: Text(
                  widget.buttonText.toUpperCase(),
                  style: TextStyle(
                    color: widget.color == Color(0xFFF5F5F5)
                        ? Colors.black
                        : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // return Align(
    //   alignment: Alignment.center,
    //   child: Container(
    //     height: 55,
    //     width: buttonWidth,
    //     child: Center(
    //         child: Text(
    //       widget.buttonText.toUpperCase(),
    //       style: TextStyle(
    //         color: widget.color == Colors.white ? Colors.black : Colors.white,
    //         fontSize: 12,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     )),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(50)),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Color(0xFF1C2226),
    //           offset: Offset(14.0, 14.0),
    //           blurRadius: 28.0,
    //         ),
    //         BoxShadow(
    //           color: Color(0xFF262C32),
    //           offset: Offset(-14.0, -14.0),
    //           blurRadius: 28.0,
    //         ),
    //       ],
    //       color: widget.color,
    //     ),
    //   ),
    // );

    // return Align(
    //   alignment: Alignment.center,
    //   child: Listener(
    //     onPointerDown: _onPointerDown,
    //     onPointerUp: _onPointerUp,
    //     child: AnimatedContainer(
    //       duration: const Duration(milliseconds: 1000),
    //       height: 55,
    //       width: buttonWidth,
    //       child: Padding(
    //         padding: const EdgeInsets.all(4.0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.all(Radius.circular(50)),
    //             gradient: LinearGradient(
    //               begin: Alignment.topCenter,
    //               end: Alignment.bottomCenter,
    //               colors: [
    //                 _isPressed
    //                     ? Colors.white
    //                     : widget.color.mix(Colors.white, .01),
    //                 widget.color.mix(Colors.black, .1),
    //               ],
    //             ),
    //             boxShadow: _isPressed
    //                 ? null
    //                 : [
    //                     BoxShadow(
    //                       color: widget.color
    //                           .mix(Colors.black, .1)
    //                           .withOpacity(.2),
    //                       offset: Offset(-6.0, -6.0),
    //                       blurRadius: 5.0,
    //                     ),
    //                     BoxShadow(
    //                       color: widget.color
    //                           .mix(Colors.white, .02)
    //                           .withOpacity(.5),
    //                       offset: Offset(6.0, 6.0),
    //                       blurRadius: 5.0,
    //                     ),
    //                   ],
    //             color: widget.color,
    //           ),
    //           child: Center(
    //               child: Text(
    //             widget.buttonText.toUpperCase(),
    //             style: TextStyle(
    //               color: widget.color == Colors.white
    //                   ? Colors.black
    //                   : Colors.white,
    //               fontSize: 12,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           )),
    //         ),
    //       ),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(50)),
    //         boxShadow: [
    //           BoxShadow(
    //             color: widget.color.mix(Colors.black, .5).withOpacity(.4),
    //             offset: Offset(6.0, 6.0),
    //             blurRadius: 4.0,
    //           ),
    //           BoxShadow(
    //             color: widget.color.mix(Colors.white, .1).withOpacity(.3),
    //             offset: Offset(-6.0, -6.0),
    //             blurRadius: 4.0,
    //           ),
    //         ],
    //         color: widget.color,
    //       ),
    //     ),
    //   ),
    // );
  }
}

extension ColorMix on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
