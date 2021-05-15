import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:spotify_neumorphic/theme.dart';
import 'package:spotify_neumorphic/widgets/login_button_style.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final leftPadding = MediaQuery.of(context).size.height / 30;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: leftPadding),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      child: Center(
                        child: NeumorphicIcon(
                          FontAwesomeIcons.spotify,
                          size: 60,
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            depth: 7,
                            intensity: .7,
                            shadowLightColor: Colors.white.withOpacity(.4),
                            shadowDarkColor: Colors.black,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Spotify',
                      style: TextStyle(
                          fontSize: 28,
                          letterSpacing: .1,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'helvetica-rounded',
                          color: Colors.white),
                    ),
                    Text(
                      '®',
                      style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Roboto',
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: leftPadding),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Millions of songs.',
                        style: AppTheme.dark.textTheme.headline1,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Free on spotify',
                        style: AppTheme.dark.textTheme.headline1,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Continue with',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: <Widget>[
                    LoginButton(
                      buttonText: 'Phone Number',
                      color: Color(0xFF1DB854),
                    ),
                    SizedBox(height: 20),
                    LoginButton(
                      buttonText: 'Facebook',
                      color: Color(0xFF21272C),
                    ),
                    SizedBox(height: 20),
                    LoginButton(
                      buttonText: 'Email',
                      color: Color(0xFFF5F5F5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: leftPadding, top: 20.0),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      child: Icon(
                        FontAwesomeIcons.spotify,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Spotify',
                      style: TextStyle(
                          fontSize: 28,
                          letterSpacing: .1,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'helvetica-rounded',
                          color: Colors.white),
                    ),
                    Text(
                      '®',
                      style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Roboto',
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: leftPadding),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Millions of songs.',
                              style: AppTheme.dark.textTheme.headline1,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Free on spotify',
                              style: AppTheme.dark.textTheme.headline1,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Continue with',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: <Widget>[
                          LoginButton(
                            buttonText: 'Phone Number',
                            color: Color(0xFF1DB854),
                          ),
                          SizedBox(height: 15),
                          LoginButton(
                            buttonText: 'Facebook',
                            color: Color(0xFF21272C),
                          ),
                          SizedBox(height: 15),
                          LoginButton(
                            buttonText: 'Email',
                            color: Color(0xFFF5F5F5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
