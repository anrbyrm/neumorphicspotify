import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'screens.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var navIndex = 0;

  final _pages = List<Widget>.unmodifiable([
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
  ]);

  final _iconList = List<String>.unmodifiable([
    'assets/icons/home_outline.svg',
    'assets/icons/search_outline.svg',
    'assets/icons/albums_outline.svg',
  ]);

  final _activeIconList = List<String>.unmodifiable([
    'assets/icons/home_filled.svg',
    'assets/icons/search_filled.svg',
    'assets/icons/albums_filled.svg',
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[navIndex],
      bottomNavigationBar: CustomNavigationBar(
        iconList: _iconList,
        activeIconList: _activeIconList,
        onPressed: (i) => setState(() => navIndex = i),
        activeIndex: navIndex,
      ),
    );
  }
}

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    this.iconList,
    this.activeIconList,
    this.onPressed,
    this.activeIndex,
  }) : assert(
          iconList != null,
          activeIconList != null,
        );

  final activeIndex;

  final List<String>? iconList;
  final List<String>? activeIconList;

  final Function(int)? onPressed;

  @override
  State<StatefulWidget> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 0,
        surfaceIntensity: .35,
        lightSource: LightSource.bottom,
        boxShape: NeumorphicBoxShape.rect(),
        shape: NeumorphicShape.concave,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (var i = 0; i < widget.iconList!.length; i++)
              CustomNavigationButton(
                index: i,
                icon: widget.iconList![i],
                activeIndex: widget.activeIndex,
                onPressed: () => widget.onPressed!(i),
                activeIcon: widget.activeIconList![i],
              ),
          ],
        ),
      ),
    );
  }
}

class CustomNavigationButton extends StatelessWidget {
  final icon;
  final index;

  final onPressed;

  final activeIcon;
  final activeIndex;

  const CustomNavigationButton({
    this.icon,
    this.activeIndex,
    this.index,
    this.onPressed,
    this.activeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Neumorphic(
        style: NeumorphicStyle(
          shadowDarkColor: Colors.black,
          shadowLightColor: Colors.white.withOpacity(.2),
          depth: isActive() ? -5 : 5,
          intensity: isActive() ? .5 : .6,
          surfaceIntensity: .2,
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.convex,
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
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              isActive() ? activeIcon : icon,
              color: isActive()
                  ? Color(0xFF1DB854).withGreen(200).withOpacity(.7)
                  : Colors.white,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  bool isActive() {
    return index == activeIndex ? true : false;
  }
}
