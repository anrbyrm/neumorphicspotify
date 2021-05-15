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
  double depth = 7.0, intensity = .6;

  void _onPointerUp(PointerEvent event) {
    setState(() {
      depth = 7.0;
      intensity = .6;
    });
    Future.delayed(
      Duration(milliseconds: 200),
      () => Navigator.of(context).pushReplacementNamed('/navigation'),
    );
  }

  void _onPointerDown(PointerEvent event) {
    setState(() {
      depth = -6.0;
      intensity = .7;
    });
  }

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
      child: Listener(
        onPointerUp: _onPointerUp,
        onPointerDown: _onPointerDown,
        child: Container(
          width: buttonWidth,
          height: 55,
          child: Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              color: widget.color!,
              depth: depth,
              intensity: intensity,
              surfaceIntensity: .3,
              shadowDarkColor: Colors.black,
              shadowLightColor: Colors.white.withOpacity(.4),
              shadowDarkColorEmboss: Colors.black.withOpacity(.8),
              shadowLightColorEmboss: Colors.white.withOpacity(.3),
              boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.all(Radius.circular(50))),
              lightSource: LightSource.topLeft,
            ),
            child: Center(
              child: Text(
                widget.buttonText!.toUpperCase(),
                style: TextStyle(
                  color: widget.color == Color(0xFFF5F5F5)
                      ? Colors.black
                      : Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
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
