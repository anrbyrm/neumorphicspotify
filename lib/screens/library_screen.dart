import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int index = 0;
  final double leftPadding = 15.0;

  void onPressed(int i) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: leftPadding, top: 50.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Text(
                'Your Library',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      _buttonStyle(
                        0,
                        index,
                        buttonText: 'Playlists',
                        onPressed: ((i) => setState(() => index = i)),
                      ),
                      SizedBox(width: 15.0),
                      _buttonStyle(1, index,
                          buttonText: 'Albums',
                          onPressed: ((i) => setState(() => index = i))),
                      SizedBox(width: 15.0),
                      _buttonStyle(2, index,
                          buttonText: 'Downloads',
                          onPressed: ((i) => setState(() => index = i))),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _buttonStyle extends StatefulWidget {
  String? buttonText;
  int activeIndex = 0;
  int index;
  Function(int)? onPressed;

  _buttonStyle(this.index, this.activeIndex, {this.buttonText, this.onPressed});

  @override
  __buttonStyleState createState() => __buttonStyleState();
}

class __buttonStyleState extends State<_buttonStyle> {
  @override
  Widget build(BuildContext context) {
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        widget.onPressed!(widget.index);
      },
      child: Neumorphic(
        style: NeumorphicStyle(
          color: scaffoldColor,
          depth: isActive() ? -5 : 6,
          intensity: isActive() ? .5 : .2,
          surfaceIntensity: isActive() ? .1 : .5,
          shadowDarkColor: Colors.black,
          shadowDarkColorEmboss: Colors.black,
          border: NeumorphicBorder(
            width: 2,
            isEnabled: true,
            color: Color.lerp(scaffoldColor, Colors.black, .05),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 40,
          child: Center(
            child: Text(
              widget.buttonText!,
              style: TextStyle(
                  color: isActive()
                      ? Color(0xFF1DB854).withGreen(200).withOpacity(.7)
                      : Colors.white.withOpacity(.7),
                  fontWeight: FontWeight.bold),
            ),
=======

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Library',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
>>>>>>> 4097f0708b6e4f8d2dda8262f51c8e90afd55f05
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD

  bool isActive() {
    return widget.activeIndex == widget.index ? true : false;
  }
=======
>>>>>>> 4097f0708b6e4f8d2dda8262f51c8e90afd55f05
}
