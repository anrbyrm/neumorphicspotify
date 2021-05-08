import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class GenresListTile extends StatefulWidget {
  final int? index;
  final Color? textColor;
  final String? color;
  final String? title;
  final double? imageSize;
  final ImageProvider image;

  GenresListTile(
    this.image, {
    this.title,
    this.color,
    this.index,
    this.imageSize,
    this.textColor,
  });

  @override
  _GenresListTileState createState() => _GenresListTileState();
}

class _GenresListTileState extends State<GenresListTile> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).scaffoldBackgroundColor;

    return Padding(
      padding: EdgeInsets.only(
        left: widget.index! % 2 == 0 ? 15.0 : 0.0,
        right: widget.index! % 2 == 1 ? 15.0 : 0.0,
        bottom: 25.0,
      ),
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(
            msg: widget.title!,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            backgroundColor: Colors.grey[700]?.withOpacity(.7),
            fontSize: 13.0,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(7.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF0d1012),
                offset: Offset(5, 5),
                blurRadius: 14,
              ),
              BoxShadow(
                color: Color(0xFF353e44).withOpacity(.8),
                offset: Offset(-5, -5),
                blurRadius: 14,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorMix.mix(HexColor.fromHex(widget.color!))!,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        widget.title!,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: widget.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -11,
                      child: Transform.rotate(
                        angle: pi / 9,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            lightSource: LightSource.bottomRight,
                            border: NeumorphicBorder.none(),
                            depth: 5,
                            intensity: .5,
                            shadowDarkColor: Colors.black,
                            shadowLightColor: Colors.white.withOpacity(.5),
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(2.0)),
                            color: ColorMix.mix(
                              HexColor.fromHex(widget.color!),
                            ),
                          ),
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: widget.imageSize,
                            width: widget.imageSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              image: DecorationImage(image: widget.image),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
  static Color? mix(Color main) {
    return Color.lerp(main, Colors.white, .2);
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('FF');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
