import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginButtonPressed extends StatefulWidget {
  @override
  _LoginButtonPressedState createState() => _LoginButtonPressedState();

  LoginButtonPressed({this.buttonText, this.color});

  final String buttonText;
  final Color color;
}

class _LoginButtonPressedState extends State<LoginButtonPressed> {
  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.height / 2.7;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: buttonWidth,
        height: 55,
        child: Neumorphic(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          style: NeumorphicStyle(
            depth: -10,
            color: widget.color,
            intensity: .8,
            shadowLightColorEmboss: Colors.white.withOpacity(.5),
            shadowDarkColorEmboss: Colors.black.withOpacity(.9),
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.all(Radius.circular(50))),
            lightSource: LightSource.topLeft,
          ),
          child: Center(
            child: Text(widget.buttonText.toUpperCase()),
          ),
        ),
      ),
    );
  }
}
