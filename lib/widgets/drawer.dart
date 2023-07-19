//  IconButton(
//                 onPressed: () {
//                   if (Get.isDarkMode) {
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../shared/controllers/theme_controller.dart';
import '../themes/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                //color: context.watch<ThemeBloc>().darkTheme == false ? CustomColor().drawerHeaderColorLight : CustomColor().drawerHeaderColorDark,
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppName(
                      fontSize: 25.0,
                      // isCustomColor: true,
                    ),
                    Text(
                      'Version: 1.0.0',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Dark mode',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Icons.sunny, size: 22, color: Colors.white),
              ),
              trailing: Switch(
                  activeColor: Theme.of(context).primaryColor,
                  value: Get.isDarkMode, //TODO
                  onChanged: (bool) {
                    if (Get.isDarkMode) {
                      themeController.changeThemeMode(ThemeMode.light);
                      // themeController.saveTheme(false);
                    } else {
                      themeController.changeThemeMode(ThemeMode.dark);
                      // themeController.saveTheme(true);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

//                     themeController.changeTheme(Themes.lightTheme);
//                     themeController.saveTheme(false);
//                   } else {
//                     themeController.changeTheme(Themes.darkTheme);
//                     themeController.saveTheme(true);
//                   }
//                 },
//                 icon: Get.isDarkMode
//                     ? const Icon(Icons.light_mode_outlined)
//                     : const Icon(Icons.dark_mode_outlined),
//               ),
class AppName extends StatelessWidget {
  final double fontSize;

  final bool isCustomColor;
  const AppName({
    Key? key,
    required this.fontSize,
    this.isCustomColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Student Database',
      style: TextStyle(
          // fontFamily: 'Poppins',
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: isCustomColor ? Colors.white : Colors.grey[600]),
    );
  }
}
