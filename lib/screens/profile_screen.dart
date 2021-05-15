import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  final _iconList = List<String>.unmodifiable([
    'assets/icons/instagram_outline.svg',
    'assets/icons/facebook_outline.svg',
    'assets/icons/github_outline.svg',
  ]);

  final _activeIconList = List<String>.unmodifiable([
    'assets/icons/instagram_filled.svg',
    'assets/icons/facebook_filled.svg',
    'assets/icons/github_filled.svg',
  ]);

  final _linkList = List<String>.unmodifiable([
    'https://www.instagram.com/anrbyrm/',
    'https://www.facebook.com/anrbyrm/',
    'https://github.com/anrbyrm',
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF14181B),
                              offset: Offset(22, 22),
                              blurRadius: 35),
                          BoxShadow(
                              color: Color(0xFF2E363D),
                              offset: Offset(-22, -22),
                              blurRadius: 35),
                        ]),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Anar Bayram',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    'Flutter enthusiast.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 12.0),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'This app uses various libraries that created by community. Credits go to owners. Created for practicing shadows and Neumorphic design in Flutter. For learning purposes this project is open-source.',
                style: TextStyle(
                  color: Colors.white.withOpacity(.7),
                  fontSize: 13.0,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    '@anrbyrm',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      for (var i = 0; i < _iconList.length; i++)
                        CustomIcon(
                          index: i,
                          link: _linkList[i],
                          iconPath: _iconList[i],
                          activeIconPath: _activeIconList[i],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIcon extends StatefulWidget {
  final int? index;

  final String? link;
  final String? iconPath;
  final String? activeIconPath;

  const CustomIcon({
    this.link,
    this.index,
    this.iconPath,
    this.activeIconPath,
  });

  @override
  _CustomIconState createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  String? path;

  @override
  void initState() {
    super.initState();
    setState(() => path = widget.iconPath);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.index != 0 ? 18.0 : 0.0,
      ),
      child: Listener(
        onPointerUp: (event) => _onPointerUp(event, widget.link),
        onPointerDown: _onPointerDown,
        child: Container(
          width: 40,
          height: 40,
          child: SvgPicture.asset(
            path!,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _onPointerUp(PointerEvent event, String? url) {
    _launchUrl(url!);
    setState(() => path = widget.iconPath);
  }

  void _onPointerDown(PointerEvent event) {
    setState(() => path = widget.activeIconPath);
  }

  _launchUrl(String? url) async {
    if (await canLaunch(url!)) {
      await launch(url);
    } else {
      throw 'Could not launc $url';
    }
  }
}
