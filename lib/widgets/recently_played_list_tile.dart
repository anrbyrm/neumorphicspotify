import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RecentlyPlayedListTile extends StatelessWidget {
  final String name;
  final String artist;
  final String imagePath;
  final int index;
  final int last;

  const RecentlyPlayedListTile({
    @required this.name,
    @required this.artist,
    @required this.imagePath,
    this.index,
    this.last,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: index == 0 ? 10.0 : 20.0, right: index == last ? 10.0 : 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 170,
            width: 170,
            child: Neumorphic(
              style: NeumorphicStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: NeumorphicShape.concave,
                boxShape: NeumorphicBoxShape.circle(),
                depth: 7,
                surfaceIntensity: .1,
                intensity: .4,
                shadowDarkColor: Colors.black,
                shadowLightColor: Colors.white,
                lightSource: LightSource.topLeft,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: 6,
                    intensity: .1,
                    lightSource: LightSource.top,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(imagePath)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            artist,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
                color: Colors.white.withOpacity(.4),
                fontWeight: FontWeight.normal,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
