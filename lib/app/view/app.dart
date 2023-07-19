import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../shared/bindings/app_bindings.dart';
import '../../shared/controllers/theme_controller.dart';
import '../../shared/data/network_client/dio_client.dart';
import '../../themes/theme.dart';
import '../routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}

class AppView extends StatefulWidget {
  AppView({
    Key? key,
  }) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final themeController = Get.put(ThemeController());

  late final _router;
  final DioClient _dio = DioClient();

  @override
  void initState() {
    _router = AppRouter();

    super.initState();
  }

  @override
  void dispose() {
    _router.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        designSize: const Size(360, 800),
        builder: (ctx, _) {
          return GetMaterialApp(
            initialBinding: AppBinding(),
            debugShowCheckedModeBanner: false,
            theme: Themes.lightTheme,
            themeMode: themeController.theme,
            darkTheme: Themes.darkTheme,
            title: 'Student Management',
            onGenerateRoute: _router.onGenerateRoute,
          );
        });
  }
}
