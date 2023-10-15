import 'package:flora/screens/splash.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case '/Home':
      //   return MaterialPageRoute(builder: (_) => HomePage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        // AIzaSyBqQgxHuVeDKakkoeYwSMYZG8V5eStMHR4
        return MaterialPageRoute(
            builder: (_) => const Scaffold(body: SizedBox(height: 0)));
    }
  }
}
