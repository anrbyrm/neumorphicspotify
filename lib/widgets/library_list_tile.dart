import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:spotify_neumorphic/models/library.dart';
import 'package:spotify_neumorphic/screens/screens.dart';
import 'package:spotify_neumorphic/widgets/neumorphic_button_style.dart';

class LibraryListTile extends StatelessWidget {
  final String? title;
  final String? author;

  final int? type;
  final int? songCount;

  final List<Song>? songsList;

  final ImageProvider image;

  List<String> _type = ['Playlist', 'Album'];

  LibraryListTile(
    this.image, {
    this.type,
    this.title,
    this.author,
    this.songCount,
    this.songsList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        child: Container(
          height: 100,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => SongsScreen(
                      songsList: songsList,
                      image: image,
                      title: title,
                      author: author,
                      type: type,
                    ),
                  ),
                ),
                child: Row(
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
                        height: 80,
                        width: 80,
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
                                color: Colors.white),
                          ),
                          SizedBox(height: 2.0),
                          Row(
                            children: <Widget>[
                              Text(
                                _type[type!] + ' ·',
                                style: TextStyle(color: Colors.grey),
                              ),
                              countOrAuthor(context),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomNeumorphicButton(
                    icon: Icons.more_vert_outlined,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget countOrAuthor(context) {
    if (songCount != 0) {
      return Text(
        songCount == 1 ? ' 1 song' : ' $songCount songs',
        style: TextStyle(color: Colors.grey),
      );
    } else {
      return Text(
        ' $author',
        style: TextStyle(color: Colors.grey),
      );
    }
  }
}
