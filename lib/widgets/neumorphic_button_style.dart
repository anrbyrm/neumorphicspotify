import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicButton extends StatefulWidget {
  IconData? icon;

  CustomNeumorphicButton({this.icon});

  @override
  _CustomNeumorphicButtonState createState() => _CustomNeumorphicButtonState();
}

class _CustomNeumorphicButtonState extends State<CustomNeumorphicButton> {
  var depth = 6.0, intensity = .6;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: _onPointerUp,
      onPointerDown: _onPointerDown,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: depth,
          intensity: intensity,
          surfaceIntensity: .3,
          shadowLightColor: Colors.white.withOpacity(.4),
          shadowDarkColor: Colors.black,
          shadowDarkColorEmboss: Colors.black,
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.circle(),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Container(
          height: 30,
          width: 30,
          child: Icon(
            widget.icon,
            size: 15.0,
            color: Colors.white.withOpacity(.7),
          ),
        ),
      ),
    );
  }

  void _onPointerUp(PointerEvent event) {
    setState(() {
      depth = 6.0;
      intensity = .6;
      HapticFeedback.lightImpact();
    });
  }

  void _onPointerDown(PointerEvent event) {
    setState(() {
      depth = -5.0;
      intensity = .5;
    });
  }
}
