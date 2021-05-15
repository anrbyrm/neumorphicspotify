import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:spotify_neumorphic/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/navigation':
        return CupertinoPageRoute(builder: (_) => NavigationScreen());
      case '/login':
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case '/home':
        return CupertinoPageRoute(builder: (_) => HomeScreen());
      case '/profile':
        return CupertinoPageRoute(builder: (_) => ProfileScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
