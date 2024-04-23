import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mad_practical/pages/Home_page.dart';
import 'package:mad_practical/pages/Landing_page.dart';
import 'package:mad_practical/pages/story_page.dart';

class NavigationService {
  late GlobalKey<NavigatorState> _navigatorKey;

  final Map<String, Widget Function(BuildContext)> _routes = {
    "/": (context) => LandingPage(),
    '/home': (context) => HomePage(),
    '/storyscreen': (context) => StoryScreen()
  };

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Map<String, Widget Function(BuildContext)> get routes => _routes;

  NavigationService() {
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  void pushNamed(String routeName) {
    _navigatorKey.currentState!.pushNamed(routeName);
  }

  void push(MaterialPageRoute routeName) {
    _navigatorKey.currentState!.push(routeName);
  }

  void goback() {
    _navigatorKey.currentState!.pop();
  }

  void pushReplacementNamed(String routeName) {
    _navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
