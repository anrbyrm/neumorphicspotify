import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:spotify_neumorphic/theme.dart';
import 'package:spotify_neumorphic/route_generator.dart';
import 'package:spotify_neumorphic/screens/screens.dart';

void main() {
  runApp(SpotifyRedesign());
}

class SpotifyRedesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.dark,
      home: LoginScreen(),
    );
  }
}
