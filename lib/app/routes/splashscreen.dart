import 'package:flutter/material.dart';

import '../../features/students/screens/studentslist_screen.dart';
import '../../themes/color_variables.dart';

class SplashScreen extends StatelessWidget {
  static const routName = "/splashscreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StudentListScreen();

    // Scaffold(
    //   backgroundColor: ReplyColors.white,
    //   body: Center(
    //     child: Stack(
    //       children: const [
    //         Align(alignment: Alignment.center, child: Text("Splash Screen")),
    //       ],
    //     ),
    //   ),
    // );
  }
}
