import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginButton extends StatefulWidget {
  final Color? color;
  final String? buttonText;

  const LoginButton({
    this.buttonText,
    this.color,
  });

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
            color: widget.color!.withOpacity(.95),
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
                Navigator.of(context).pushNamed('/navigation');
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
                  widget.buttonText!.toUpperCase(),
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
  }
}

extension ColorMix on Color {
  Color? mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
