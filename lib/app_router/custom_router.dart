import 'package:dictionary_sitkat/app_router/router_constants.dart';
import 'package:dictionary_sitkat/screens/home_screen.dart';
import 'package:dictionary_sitkat/screens/not_found_screen.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case aboutRoute:
      //   return MaterialPageRoute(builder: (_) => const AboutPage());
      // case settingsRoute:
      //   return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}