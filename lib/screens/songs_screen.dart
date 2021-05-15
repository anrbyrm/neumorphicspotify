import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:spotify_neumorphic/models/library.dart';

import 'package:spotify_neumorphic/widgets/song_list_tile.dart';
import 'package:spotify_neumorphic/widgets/neumorphic_button_style.dart';

class SongsScreen extends StatelessWidget {
  int? type;
  String? title;
  String? author;

  List<Song>? songsList;

  ImageProvider? image;

  SongsScreen({
    this.songsList,
    this.type,
    this.image,
    this.title,
    this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: CustomBehaviour(),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomDelegate(
                image!,
                title!,
                author!,
                type!,
              ),
              floating: true,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SongListTile(
                    AssetImage(songsList![index].imagePath!),
                    index: index,
                    type: type,
                    title: songsList![index].title,
                    author: songsList![index].author,
                  );
                },
                childCount: songsList!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(context, child, axisDirection) {
    return child;
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  int? type;
  String? title;
  String? author;

  ImageProvider? image;

  CustomDelegate(
    this.image,
    this.title,
    this.author,
    this.type,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var shrinkPercentage =
        min(1, shrinkOffset / (maxExtent - minExtent)).toDouble();

    return Stack(
      clipBehavior: Clip.antiAlias,
      fit: StackFit.loose,
      children: [
        Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
        Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 25,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: CustomNeumorphicButton(
                              icon: Icons.arrow_back_ios_rounded,
                            ),
                          ),
                          Flexible(
                            child: Opacity(
                              opacity: shrinkPercentage,
                              child: Text(
                                title!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          CustomNeumorphicButton(
                            icon: Icons.more_vert,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 1 - shrinkPercentage,
                    child: Neumorphic(
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
                      child: AnimatedContainer(
                        duration: Duration.zero,
                        width: 170 - shrinkPercentage * 20,
                        height: 170 - shrinkPercentage * 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: FractionalOffset.topCenter,
                          image: image!,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Opacity(
                    opacity: max(1 - shrinkPercentage * 4, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          title!,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          type == 1
                              ? 'Album by $author'
                              : 'by anrbyrm'.toUpperCase(),
                          style: TextStyle(
                            fontSize: type == 1 ? 11.0 : 9.0,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: shrinkPercentage == 1 ? 0.0 : 22.5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 140,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.green.withGreen(400),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Shuffle Play',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => 390;

  @override
  double get minExtent => 125;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
