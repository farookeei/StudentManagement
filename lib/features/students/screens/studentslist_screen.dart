import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_sample/config/const/constants.dart';
import 'package:test_sample/layout/layout_scaffold.dart';
import 'package:test_sample/widgets/drawer.dart';

import '../../../widgets/appbar/custom_appbar.dart';
import '../../../widgets/tab/tab.dart';
import '../data/student_controller.dart';
import '../widgets/custom_floating_button.dart';
import '../widgets/card_view.dart';
import '../widgets/table_view.dart';

class StudentListScreen extends GetView<StudentController> {
  static const routeName = '/studentList-screen';

  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
        drawer: const CustomDrawer(),
        floatingActionButton: AddStudents(
          controller: controller,
        ),
        customAppBar: const CustomAppBar(
            isLeadingEnabled: false, title: "Student Database"),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => CustomTabSwitch(
                  explicitMargin: 2,
                  explicitWidth: 190,
                  defaultTab: controller.viewMode.value,
                  activeColor: Theme.of(context).primaryColor,
                  label: "View as",
                  tabs: Constants().viewMode,
                  onChange: (e) {
                    controller.updateDataView(e);
                  },
                ),
              ),
              const Customtable(),
              const CustomListView()
            ],
          ),
        ));
  }
}
