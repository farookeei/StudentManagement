import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_sample/layout/layout_scaffold.dart';
import 'package:test_sample/widgets/bottom%20sheet/bottom_sheet.dart';
import 'package:test_sample/widgets/buttons/button.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../themes/theme.dart';
import '../../../widgets/appbar/custom_appbar.dart';
import '../../../widgets/tab/tab.dart';
import '../data/student_controller.dart';
import '../widgets/add_edit_Child.dart';
import '../widgets/list_view.dart';
import '../widgets/table.dart';

class StudentListScreen extends GetView<StudentController> {
  static const routeName = '/studentList-screen';

  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> viewMode = ["Table", "Card"];

    final ThemeController themeController = Get.find<ThemeController>();
    return LayoutScaffold(
        customAppBar: const CustomAppBar(
            isLeadingEnabled: false,
            backgroundColor: Colors.blue, //!theme
            //automaticallyImplyLeading: false,
            title: "StudentList"),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  if (Get.isDarkMode) {
                    themeController.changeTheme(Themes.lightTheme);
                    themeController.saveTheme(false);
                  } else {
                    themeController.changeTheme(Themes.darkTheme);
                    themeController.saveTheme(true);
                  }
                },
                icon: Get.isDarkMode
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined),
              ),
              CustomButton(
                  onTap: () {
                    controller.cleardata();
                    controller.clearValidation();
                    fixedBottomSheet(
                        context: context,
                        type: FixedSheetType.floating,
                        child: const AddEditChild(
                          isEditStudent: false,
                        ));
                  },
                  width: 70.w,
                  child: Text("Add")),
              CustomTabSwitch(
                explicitMargin: 2,
                explicitWidth: 190,
                // defaultTab:
                //     state.isSafeZone ? GeofenceTypes.first : GeofenceTypes.last,
                label: "Data View",
                tabs: viewMode,
                onChange: (e) {
                  controller.updateDataView();
                },
              ),
              const Customtable(),
              const CustomListView()
            ],
          ),
        ));
  }
}
