import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WelcomeTile extends StatefulWidget {
  final int? index;

  final String? title;
  final String? imagePath;

  WelcomeTile({
    @required this.title,
    @required this.imagePath,
    @required this.index,
  });

  @override
  _WelcomeTileState createState() => _WelcomeTileState();
}

class _WelcomeTileState extends State<WelcomeTile> {
  double depth = 6.0, intensity = .6;

  void _onPointerUp(PointerEvent event) {
    setState(() {
      depth = 6.0;
      intensity = .6;
      Fluttertoast.showToast(
        msg: widget.title!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        backgroundColor: Colors.grey[700]?.withOpacity(.7),
        fontSize: 13.0,
      );
    });
  }

  void _onPointerDown(PointerEvent event) {
    setState(() {
      depth = -5.0;
      intensity = .5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: (widget.index! % 2 == 0) ? 0.0 : 10.0,
        left: 15.0,
        bottom: 15.0,
      ),
      child: Listener(
        onPointerUp: _onPointerUp,
        onPointerDown: _onPointerDown,
        child: Neumorphic(
          style: NeumorphicStyle(
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.all(Radius.circular(8))),
            depth: depth,
            intensity: intensity,
            surfaceIntensity: .3,
            shadowDarkColor: Colors.black,
            shadowLightColor: Colors.white.withOpacity(.4),
            lightSource: LightSource.top,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(widget.imagePath!),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.title!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
