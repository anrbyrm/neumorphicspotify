import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:spotify_neumorphic/theme.dart';
import 'package:spotify_neumorphic/models/genres.dart';
import 'package:spotify_neumorphic/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int? tappedIndex;
  double padding = 0.0;
  double? imageSize;
  Color? textColor;

  final double leftPadding = 15.0;
  List<GenresModel>? __allGenres;
  List<GenresModel>? __genresList;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 50.0, left: leftPadding),
                child: Text(
                  'Search',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 15.0, left: leftPadding),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    color: bgColor,
                    depth: 4,
                    intensity: .3,
                    shadowDarkColor: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        depth: -5,
                        intensity: .5,
                        surfaceIntensity: .1,
                        shadowDarkColorEmboss: Colors.black,
                        border: NeumorphicBorder(
                          isEnabled: true,
                          width: 4,
                          color: bgColor,
                        ),
                        color: bgColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextField(
                          cursorWidth: 1.0,
                          cursorHeight: 15.0,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Artists, songs or podcasts',
                            hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: double.infinity,
                              minWidth: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FutureBuilder<String>(
                  future: _getGenres(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final jsonResponse = json.decode(snapshot.data!);
                      final allGenresData = jsonResponse['all'] as List;
                      final allGenres = allGenresData
                          .map<GenresModel>(
                              (json) => GenresModel.fromJson(json))
                          .toList();
                      final topGenresData = jsonResponse['top'] as List;
                      final topGenres = topGenresData
                          .map<GenresModel>(
                              (json) => GenresModel.fromJson(json))
                          .toList();
                      __allGenres = allGenres;
                      __genresList = topGenres;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25.0),
                          Padding(
                            padding: EdgeInsets.only(left: leftPadding),
                            child: Text(
                              'Your top genres',
                              style: CustomTextTheme.bodyText(context),
                            ),
                          ),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              childAspectRatio: (1.6 / 1),
                            ),
                            itemBuilder: (context, index) {
                              return _listenerWidget(
                                index,
                                GenresListTile(
                                  AssetImage(__genresList![index].image!),
                                  title: __genresList![index].title,
                                  color: __genresList![index].color,
                                  index: index,
                                  textColor: tappedIndex == index
                                      ? Colors.white.withOpacity(.6)
                                      : Colors.white,
                                  imageSize: tappedIndex == index ? 60.0 : 65.0,
                                ),
                              );
                            },
                            itemCount: __genresList!.length,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: leftPadding),
                            child: Text(
                              'Browse all',
                              style: CustomTextTheme.bodyText(context),
                            ),
                          ),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              childAspectRatio: (1.6 / 1),
                            ),
                            itemBuilder: (context, index) {
                              return _listenerWidget(
                                index + 10,
                                GenresListTile(
                                  AssetImage(__allGenres![index].image!),
                                  title: __allGenres![index].title,
                                  color: __allGenres![index].color,
                                  index: index,
                                  textColor: tappedIndex == index + 10
                                      ? Colors.white.withOpacity(.6)
                                      : Colors.white,
                                  imageSize:
                                      tappedIndex == index + 10 ? 60.0 : 65.0,
                                ),
                              );
                            },
                            itemCount: __allGenres!.length,
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('error');
                    } else {
                      return Center(child: Text('loading...'));
                    }
                  }),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _getGenres() async {
    final genresJson = await rootBundle.loadString('assets/json/genres.json');

    return Future.delayed(const Duration(milliseconds: 1000), () => genresJson);
  }

  Widget _listenerWidget(int index, child) {
    return Padding(
      padding: EdgeInsets.all(tappedIndex == index ? 2.0 : 0.0),
      child: Listener(
        onPointerDown: ((PointerEvent event) => setState(() {
              tappedIndex = index;
            })),
        onPointerUp: ((PointerEvent event) => setState(() {
              tappedIndex = -1;
            })),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 2000),
          child: child,
        ),
      ),
    );
  }
}
