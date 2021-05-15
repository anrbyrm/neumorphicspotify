import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:spotify_neumorphic/models/models.dart';
import 'package:spotify_neumorphic/widgets/home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool _isVisible = false;
  bool _othersVisible = false;

  List<SongModel> _recentCards = [];
  List<SongModel> _playlistsFlow = [];
  List<WelcomeModel> _firstCards = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      if (this.mounted) setState(() => _othersVisible = true);
    });
    Future.delayed(const Duration(milliseconds: 1100)).then((value) {
      if (this.mounted) setState(() => _isVisible = true);
    });
    getCards();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leftPadding = 15.0;

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  right: 15,
                  bottom: 5,
                ),
                child: AnimatedOpacity(
                  opacity: _othersVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          depth: 6,
                          intensity: .7,
                          surfaceIntensity: .1,
                          shape: NeumorphicShape.concave,
                          shadowDarkColor: Colors.black,
                          shadowLightColor: Colors.white.withOpacity(.45),
                          boxShape: NeumorphicBoxShape.circle(),
                          color: Theme.of(context).scaffoldBackgroundColor),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            depth: -1,
                            intensity: .1,
                            shadowDarkColor: Colors.black,
                            boxShape: NeumorphicBoxShape.circle(),
                            color: Theme.of(context).scaffoldBackgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            child: NeumorphicButton(
                                padding: const EdgeInsets.only(right: .05),
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeIn,
                                onPressed: (() {
                                  Fluttertoast.showToast(
                                    msg: 'Settings icon is clicked.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    textColor: Colors.white,
                                    backgroundColor:
                                        Colors.grey[700]?.withOpacity(.7),
                                    fontSize: 13.0,
                                  );
                                }),
                                style: NeumorphicStyle(
                                    depth: 6,
                                    intensity: .2,
                                    surfaceIntensity: .4,
                                    shadowDarkColor: Colors.black,
                                    shape: NeumorphicShape.convex,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/cog.svg',
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(
              future: getCards(),
              builder: (context, snapshot) {
                if (_isLoading)
                  return SliverToBoxAdapter(
                    child: AnimatedOpacity(
                      opacity: _isVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: leftPadding),
                            child: Text(
                              'Good Morning',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              childAspectRatio: (2.5 / 1),
                            ),
                            itemBuilder: (context, index) {
                              return WelcomeTile(
                                title: _firstCards[index].title,
                                imagePath: _firstCards[index].imagePath,
                                index: index,
                              );
                            },
                            itemCount: _firstCards.length,
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.only(left: leftPadding),
                            child: Text(
                              'Recently Played',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 230,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: _recentCards.length,
                              itemBuilder: (context, index) {
                                return RecentlyPlayedListTile(
                                  name: _recentCards[index].name,
                                  artist: _recentCards[index].artist,
                                  imagePath: _recentCards[index].imagePath,
                                  index: index,
                                  last: _recentCards.length - 1,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.only(left: leftPadding),
                            child: Text(
                              'Playlists Flow',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 220,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: _playlistsFlow.length,
                              itemBuilder: (context, index) {
                                return PlaylistsFlowListTile(
                                  title: _playlistsFlow[index].name,
                                  artist: _playlistsFlow[index].artist,
                                  imagePath: _playlistsFlow[index].imagePath,
                                  index: index,
                                  last: _playlistsFlow.length - 1,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                else
                  return SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF1DB854).withGreen(200).withOpacity(.7),
                        ),
                      ),
                    ),
                  );
              }),
        ],
      ),
    );
  }

  Future<void> getCards() async {
    final welcomeJson = await rootBundle.loadString('assets/json/welcome.json');
    final recentsJson =
        await rootBundle.loadString('assets/json/recently_played.json');
    final playlistsJson =
        await rootBundle.loadString('assets/json/playlists_flow.json');
    final welcomeResponse = json.decode(welcomeJson);
    final recentsResponse = json.decode(recentsJson);
    final playlistsResponse = json.decode(playlistsJson);
    final welcomeData = welcomeResponse['cards'] as List;
    final recentsData = recentsResponse['recently_played'] as List;
    final playlistsData = playlistsResponse['playlists_flow'] as List;
    final firstCards = welcomeData
        .map<WelcomeModel>((json) => WelcomeModel.fromJson(json))
        .toList();
    final recentsCards =
        recentsData.map<SongModel>((json) => SongModel.fromJson(json)).toList();
    final playlistsCards = playlistsData
        .map<SongModel>((json) => SongModel.fromJson(json))
        .toList();
    Future.delayed(const Duration(milliseconds: 1000), (() {
      if (this.mounted)
        setState(() {
          _isLoading = true;
          _firstCards = firstCards;
          _recentCards = recentsCards;
          _playlistsFlow = playlistsCards;
        });
    }));
  }
}
