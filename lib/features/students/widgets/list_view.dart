import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../themes/color_variables.dart';
import '../../../widgets/bottom sheet/bottom_sheet.dart';
import '../data/student_controller.dart';
import 'add_edit_Child.dart';

class CustomListView extends GetView<StudentController> {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isTableview.value
        ? SizedBox()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.students.length,
            itemBuilder: (ctx, i) {
              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: ReplyColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(width: 1, color: ReplyColors.neutral75),
                ),
                child: ListTile(
                    trailing: Icon(Icons.edit),
                    onTap: () {
                      controller.clearValidation();

                      fixedBottomSheet(
                          context: context,
                          type: FixedSheetType.floating,
                          child: AddEditChild(
                            isEditStudent: true,
                            student: controller.students[i],
                          ));
                    },
                    title: Text(
                      controller.students[i].name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    subtitle: Text(
                      controller.students[i].age.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    )),
              );
            },
          ));
  }
}
