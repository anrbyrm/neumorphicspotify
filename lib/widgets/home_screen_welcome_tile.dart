import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WelcomeTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final int index;

  const WelcomeTile({
    @required this.title,
    @required this.imagePath,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: (index % 2 == 0) ? 0.0 : 10.0,
        left: 10.0,
        bottom: 5.0,
      ),
      child: Neumorphic(
        style: NeumorphicStyle(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.all(Radius.circular(8))),
          depth: 6,
          surfaceIntensity: .1,
          intensity: .2,
          shadowDarkColor: Colors.black,
          shadowLightColor: Colors.white,
          lightSource: LightSource.top,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(imagePath),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title,
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
    );
  }
}
