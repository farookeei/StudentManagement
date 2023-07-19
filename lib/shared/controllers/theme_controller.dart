import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../themes/theme.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  bool _loadTheme() {
    if (_box.hasData(_key)) {
      return _box.read(_key) ?? false;
    } else {
      return Get.isPlatformDarkMode;
    }
  }

  void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);
  void changeTheme(ThemeData theme) {
    Get.changeTheme(theme);
    saveTheme(theme == Themes.darkTheme);
  }

  void changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    saveTheme(themeMode == ThemeMode.dark);
  }
}
