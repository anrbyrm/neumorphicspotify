import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:spotify_neumorphic/widgets/neumorphic_button_style.dart';

class SongListTile extends StatelessWidget {
  final int? type;
  final int? index;

  final String? title;
  final String? author;

  final ImageProvider image;

  SongListTile(
    this.image, {
    this.type,
    this.index,
    this.title,
    this.author,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 0:
        return Padding(
          padding: EdgeInsets.only(
              left: 15.0, right: 15.0, top: index == 0 ? 10.0 : 0.0),
          child: Container(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 7,
                    intensity: .6,
                    surfaceIntensity: .2,
                    shape: NeumorphicShape.flat,
                    shadowDarkColor: Colors.black,
                    shadowLightColor: Colors.white.withOpacity(.40),
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(5.0)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0),
                      ),
                      SizedBox(height: 2.5),
                      Text(
                        author!,
                        style: TextStyle(color: Colors.grey, fontSize: 11.0),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomNeumorphicButton(
                    icon: Icons.more_vert_outlined,
                  ),
                ),
              ],
            ),
          ),
        );
      case 1:
        return Padding(
          padding: EdgeInsets.only(
              left: 15.0, right: 15.0, top: index == 0 ? 10.0 : 0.0),
          child: Container(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0),
                    ),
                    SizedBox(height: 5),
                    Text(
                      author!,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomNeumorphicButton(
                    icon: Icons.more_vert_outlined,
                  ),
                ),
              ],
            ),
          ),
        );
      default:
        return Container(child: Center(child: Text('ana')));
    }
  }
}
