import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RecentlyPlayedListTile extends StatelessWidget {
  final int? last;
  final int? index;

  final String? name;
  final String? artist;
  final String? imagePath;

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
          left: index == 0 ? 15.0 : 20.0, right: index == last ? 15.0 : 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            child: Neumorphic(
              style: NeumorphicStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
                depth: 7,
                surfaceIntensity: .1,
                intensity: .6,
                shadowDarkColor: Colors.black,
                shadowLightColor: Colors.white.withOpacity(.5),
                lightSource: LightSource.topLeft,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(imagePath!)),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            name!,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            artist!,
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
