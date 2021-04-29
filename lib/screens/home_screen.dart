import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:spotify_neumorphic/models/models.dart';
import 'package:spotify_neumorphic/widgets/home_screen_welcome_tile.dart';
import 'package:spotify_neumorphic/widgets/recently_played_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Welcome> _firstCards = [];
  List<RecentlyPlayed> _recentCards = [];

  @override
  void initState() {
    super.initState();
    getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Good Morning',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: (3 / 1),
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Recently Played',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 250,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getCards() async {
    final welcomeJson = await rootBundle.loadString('assets/json/welcome.json');
    final recentsJson =
        await rootBundle.loadString('assets/json/recently_played.json');
    final welcomeResponse = json.decode(welcomeJson);
    final recentsResponse = json.decode(recentsJson);
    final welcomeData = welcomeResponse['cards'] as List;
    final recentsData = recentsResponse['recently_played'] as List;
    final firstCards =
        welcomeData.map<Welcome>((json) => Welcome.fromJson(json)).toList();
    final recentsCards = recentsData
        .map<RecentlyPlayed>((json) => RecentlyPlayed.fromJson(json))
        .toList();
    setState(() {
      _firstCards = firstCards;
      _recentCards = recentsCards;
    });
  }
}
