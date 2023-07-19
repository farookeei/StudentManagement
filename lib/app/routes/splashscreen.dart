import 'package:flutter/material.dart';

import '../../features/students/screens/studentslist_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routName = "/splashscreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const StudentListScreen();
  }
}
