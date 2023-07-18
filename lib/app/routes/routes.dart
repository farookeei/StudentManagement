import 'package:flutter/material.dart';
import 'package:test_sample/app/routes/splashscreen.dart';

import '../../features/students/screens/studentslist_screen.dart';

class AppRouter {
  AppRouter();

  Route onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case StudentListScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const StudentListScreen());
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
