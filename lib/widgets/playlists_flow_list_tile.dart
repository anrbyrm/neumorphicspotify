import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PlaylistsFlowListTile extends StatefulWidget {
  final int? last;
  final int? index;

  final String? title;
  final String? artist;
  final String? imagePath;

  PlaylistsFlowListTile({
    @required this.title,
    @required this.artist,
    @required this.imagePath,
    this.index,
    this.last,
  });

  @override
  _PlaylistsFlowListTileState createState() => _PlaylistsFlowListTileState();
}

class _PlaylistsFlowListTileState extends State<PlaylistsFlowListTile> {
  double depth = 7.0, intensity = .7;

  void _onPointerUp(PointerEvent event) {
    setState(() {
      depth = 6.0;
      intensity = .6;
    });
  }

  void _onPointerDown(PointerEvent event) {
    setState(() {
      depth = -6.0;
      intensity = .5;
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.index == 0 ? 15.0 : 20.0,
          right: widget.index == widget.last ? 15.0 : 0.0),
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
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
                  depth: depth,
                  surfaceIntensity: .3,
                  intensity: intensity,
                  shadowDarkColor: Colors.black,
                  shadowLightColor: Colors.white.withOpacity(.4),
                  lightSource: LightSource.topLeft,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath!),
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
                  widget.title!,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(height: 5),
                Text(
                  'by ${widget.artist}',
                  style: TextStyle(
                      color: Colors.white.withOpacity(.4),
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
