import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:spotify_neumorphic/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final leftPadding = 15.0;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Padding(
          padding: EdgeInsets.only(left: leftPadding),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Search',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      color: color,
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
                            color: color,
                          ),
                          color: color,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.0),
                    Text(
                      'Your top genres',
                      style: CustomTextTheme.bodyText(context),
                    ),
                    SizedBox(height: 25.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
