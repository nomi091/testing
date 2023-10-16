import 'package:flutter/material.dart';

import '../view/home_screen.dart';

class ScreenRoutes {
  static const String home = "home";
 

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
