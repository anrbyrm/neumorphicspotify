import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PlaylistsFlowListTile extends StatelessWidget {
  final int? last;
  final int? index;
  final String? name;
  final String? artist;
  final String? imagePath;

  PlaylistsFlowListTile({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            child: Neumorphic(
              style: NeumorphicStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(10.0)),
                depth: 4,
                surfaceIntensity: .1,
                intensity: .4,
                shadowDarkColor: Colors.black,
                shadowLightColor: Colors.white.withOpacity(.8),
                lightSource: LightSource.topLeft,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(10.0)),
                    depth: 6,
                    intensity: .1,
                    lightSource: LightSource.top,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath!),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(height: 5),
              Text(
                'by $artist',
                style: TextStyle(
                    color: Colors.white.withOpacity(.4),
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
