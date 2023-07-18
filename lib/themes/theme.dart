import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:test_sample/themes/typography.dart';

import 'color_variables.dart';

// class AppTheme {
//   static ThemeData light = ThemeData(
//     dialogBackgroundColor: const Color(0xffFFFBFB).withOpacity(0.6),
//     bottomSheetTheme: const BottomSheetThemeData(
//         backgroundColor: Colors.transparent,
//         modalBarrierColor: Colors.transparent,
//         modalElevation: 0,
//         modalBackgroundColor: Colors.transparent,
//         surfaceTintColor: Colors.transparent,
//         elevation: 0),
//     dialogTheme: DialogTheme(
//         surfaceTintColor: Colors.transparent, shadowColor: Colors.transparent),
//     scaffoldBackgroundColor: const Color(0xffFFFFFF),
//     cardColor: const Color(0xffFFFFFF),
//     //canvasColor: const Color(0xffF5F6FA),
//     canvasColor: Colors.white,
//     dividerColor: Colors.transparent,
//     iconTheme: const IconThemeData(
//       color: ReplyColors.blue75,
//     ),
//     appBarTheme: AppBarTheme(
//       iconTheme: IconThemeData(
//         color: const Color(0xff1C1C1E),
//         size: 30.r,
//       ),
//     ),
//     fontFamily: 'EuclidCircularB',
//     useMaterial3: true,
//     textTheme: TextTheme(
//       displayLarge: TextStyleTheme().displayLarge,
//       displayMedium: TextStyleTheme().displayMedium,
//       displaySmall: TextStyleTheme().displaySmall,
//       headlineLarge: TextStyleTheme().headlineLarge,
//       headlineMedium: TextStyleTheme().headlineMedium,
//       headlineSmall: TextStyleTheme().headlineSmall,
//       titleLarge: TextStyleTheme().titleLarge,
//       titleMedium: TextStyleTheme().titleMedium,
//       titleSmall: TextStyleTheme().titleSmall,
//       labelLarge: TextStyleTheme().labelLarge,
//       labelMedium: TextStyleTheme().labelMedium,
//       labelSmall: TextStyleTheme().labelSmall,
//       bodyLarge: TextStyleTheme().bodyLarge,
//       bodyMedium: TextStyleTheme().bodyMedium,
//       bodySmall: TextStyleTheme().bodySmall,

//       // subtitle2:,
//     ).apply(
//         bodyColor: ReplyColors.neutralBold,
//         displayColor: ReplyColors.neutralBold,
//         decorationColor: ReplyColors.white),
//     colorScheme: ColorScheme.fromSwatch().copyWith(
//       brightness: Brightness.light,
//       primary: ReplyColors.blue75,
//       background: const Color(0xffFFE4D4),
//       secondary: ReplyColors.blueLight,
//     ),

//     visualDensity: VisualDensity.standard,
//     splashColor: ReplyColors.blue25.withOpacity(0.3),
//     snackBarTheme: const SnackBarThemeData(
//       behavior: SnackBarBehavior.floating,
//     ),
//     typography: Typography.material2021(platform: defaultTargetPlatform),
//   );
// }
class Themes {
// Light Theme Colors
  static const Color primaryColorLight = Color(0xFF2196F3); // Blue

// Dark Theme Colors
  static const Color primaryColorDark = Color(0xFF2196F3); // Blue

// Theme Data
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColorLight,
    colorScheme: ColorScheme.light(
      primary: primaryColorLight,
      // Add more colors to the color scheme as needed
    ),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.red),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
      // Add more text styles as needed
    ),
    // Add more theme properties and configurations as needed
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColorDark,
    colorScheme: ColorScheme.dark(
      primary: primaryColorDark,
      // Add more colors to the color scheme as needed
    ),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.green),
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      // Add more text styles as needed
    ),
    // Add more theme properties and configurations as needed
  );
}
