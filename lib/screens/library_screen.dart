import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:spotify_neumorphic/models/library.dart';
import 'package:spotify_neumorphic/widgets/library_list_tile.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int index = -1;

  bool _checked = false;
  bool _isVisible = false;
  bool _othersVisible = false;

  final double leftPadding = 15.0;

  List<LibraryModel> _library = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      if (this.mounted) setState(() => _othersVisible = true);
    });
    Future.delayed(const Duration(milliseconds: 1100)).then((value) {
      if (this.mounted) setState(() => _isVisible = true);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: leftPadding, top: 50.0),
              child: AnimatedOpacity(
                opacity: _othersVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed('/profile'),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Your Library',
                      style: Theme.of(context).textTheme.headline2!,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: AnimatedOpacity(
                opacity: _othersVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        _buttonStyle(
                          0,
                          index,
                          _checked,
                          buttonText: 'Playlists',
                        ),
                        SizedBox(width: 15.0),
                        _buttonStyle(
                          1,
                          index,
                          _checked,
                          buttonText: 'Albums',
                        ),
                        SizedBox(width: 15.0),
                        _buttonStyle(
                          2,
                          index,
                          _checked,
                          buttonText: 'Downloads',
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder<String>(
              future: getLibrary(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final jsonResponse = json.decode(snapshot.data!);
                  final libraryData = jsonResponse['library'] as List;
                  final library = libraryData
                      .map<LibraryModel>((json) => LibraryModel.fromJson(json))
                      .toList();
                  _library = library;
                  return SliverToBoxAdapter(
                    child: AnimatedOpacity(
                      opacity: _isVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        itemCount: _library.length,
                        itemBuilder: (context, index) => LibraryListTile(
                          AssetImage(_library[index].imagePath!),
                          type: _library[index].type,
                          title: _library[index].title,
                          author: _library[index].author,
                          songCount: _library[index].songCount!,
                          songsList: _library[index].songsList!,
                        ),
                      ),
                    ),
                  );
                } else {
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
                }
              }),
        ],
      ),
    );
  }
}

class _buttonStyle extends StatefulWidget {
  bool _checked;

  int index;
  int activeIndex = -1;

  String? buttonText;

  _buttonStyle(
    this.index,
    this.activeIndex,
    this._checked, {
    this.buttonText,
  });

  @override
  _buttonStyleState createState() => _buttonStyleState();
}

class _buttonStyleState extends State<_buttonStyle> {
  @override
  Widget build(BuildContext context) {
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        if (this.mounted) onPressed(widget.index);
      },
      child: Neumorphic(
        style: NeumorphicStyle(
          color: scaffoldColor,
          shape: NeumorphicShape.convex,
          depth: widget._checked ? -5 : 6,
          intensity: widget._checked ? .5 : .6,
          surfaceIntensity: widget._checked ? .1 : .3,
          shadowDarkColor: Colors.black,
          shadowLightColor: Colors.white.withOpacity(.40),
          shadowDarkColorEmboss: Colors.black,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 40,
          child: Center(
            child: Text(
              widget.buttonText!,
              style: TextStyle(
                  color: widget._checked
                      ? Color(0xFF1DB854).withGreen(200).withOpacity(.7)
                      : Colors.white.withOpacity(.7),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void onPressed(int i) {
    if (this.mounted) {
      if (widget.activeIndex == i && widget._checked)
        setState(() {
          widget._checked = false;
          widget.activeIndex = -1;
        });
      else if (widget.activeIndex == i && !widget._checked)
        setState(() {
          widget._checked = false;
          widget.activeIndex = -1;
        });
      else if (widget.activeIndex != i && widget._checked)
        setState(() => widget.activeIndex = i);
      else if (widget.activeIndex != i)
        setState(() {
          widget._checked = true;
          widget.activeIndex = i;
        });
    }
  }
}

Future<String> getLibrary() async {
  final libraryJson = await rootBundle.loadString('assets/json/library.json');

  return Future.delayed(const Duration(milliseconds: 1000), () => libraryJson);
}
