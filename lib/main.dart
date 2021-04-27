import 'package:flutter/material.dart';

import 'package:spotify_neumorphic/route_generator.dart';
import 'package:spotify_neumorphic/screens/screens.dart';
import 'package:spotify_neumorphic/theme.dart';

void main() {
  runApp(SpotifyRedesign());
}

class SpotifyRedesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.dark,
      home: LoginScreen(),
    );
  }
}
