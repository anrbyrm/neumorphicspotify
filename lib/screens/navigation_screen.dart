import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'screens.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var navIndex = 0;

  final pages = List<Widget>.unmodifiable([
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
    ProfileScreen(),
  ]);

  final iconList = List<IconData>.unmodifiable([
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.album_outlined,
    FontAwesomeIcons.spotify,
  ]);

  final activeIconList = List<IconData>.unmodifiable([
    Icons.home,
    Icons.search,
    Icons.album,
    FontAwesomeIcons.spotify,
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[navIndex],
      bottomNavigationBar: CustomNavigationBar(
        iconList: iconList,
        activeIconList: activeIconList,
        onPressed: (i) => setState(
          () => navIndex = i,
        ),
        activeIndex: navIndex,
      ),
    );
  }
}

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar(
      {this.iconList, this.activeIconList, this.onPressed, this.activeIndex})
      : assert(iconList != null, activeIconList != null);
  final List<IconData>? iconList;
  final List<IconData>? activeIconList;
  final Function(int)? onPressed;
  final activeIndex;

  @override
  State<StatefulWidget> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 0,
        surfaceIntensity: .2,
        lightSource: LightSource.bottom,
        boxShape: NeumorphicBoxShape.rect(),
        shape: NeumorphicShape.concave,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Container(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (var i = 0; i < widget.iconList!.length; i++)
              widget.activeIndex == i
                  ? CustomNavigationButtonPressed(
                      color: Color(0xFF1DB854),
                      activeIcon: widget.activeIconList![i],
                    )
                  : CustomNavigationButton(
                      icon: widget.iconList![i],
                      color: Colors.white.withOpacity(.8),
                      onPressed: () => widget.onPressed!(i),
                    ),
          ],
        ),
      ),
    );
  }
}

class CustomNavigationButtonPressed extends StatelessWidget {
  final color;
  final activeIcon;

  CustomNavigationButtonPressed({this.activeIcon, this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: Neumorphic(
        style: NeumorphicStyle(
          shadowDarkColor: Colors.black,
          shadowLightColor: Colors.white,
          depth: 2,
          intensity: .3,
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.concave,
          color: Colors.black,
        ),
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Neumorphic(
              style: NeumorphicStyle(
                shadowDarkColor: Colors.black,
                shadowLightColor: Colors.white,
                depth: 1,
                intensity: .2,
                surfaceIntensity: .3,
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.concave,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Icon(
                activeIcon,
                color: color,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNavigationButton extends StatelessWidget {
  final icon;
  final color;
  final onPressed;

  const CustomNavigationButton({this.icon, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Neumorphic(
        style: NeumorphicStyle(
          shadowDarkColor: Colors.black,
          shadowLightColor: Colors.white,
          depth: 2,
          intensity: .4,
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.flat,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Neumorphic(
              style: NeumorphicStyle(
                shadowDarkColor: Colors.black,
                shadowLightColor: Colors.white,
                depth: 1,
                intensity: .2,
                surfaceIntensity: .3,
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.convex,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Icon(icon, color: color, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}
