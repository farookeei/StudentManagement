import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_sample/config/const/constants.dart';

import '../../../themes/color_variables.dart';
import '../../../widgets/bottom sheet/bottom_sheet.dart';
import '../data/student_controller.dart';
import 'add_edit_Child.dart';
import 'list_empty.dart';

class CustomListView extends GetView<StudentController> {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.viewMode.value == Constants.TABLEVIEW
        ? const SizedBox()
        : controller.students.isEmpty
            ? const ListEmpty()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.students.length,
                itemBuilder: (ctx, i) {
                  return InkWell(
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
                    child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                              width: 1, color: ReplyColors.neutral75),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ContentItem(
                                  label: "Name",
                                  value: controller.students[i].name,
                                ),
                                ContentItem(
                                  label: "Id",
                                  value: controller.students[i].id.toString(),
                                ),
                                ContentItem(
                                  label: "Age",
                                  value:
                                      "${controller.students[i].age.toString()} years",
                                ),
                                ContentItem(
                                  label: "Grade",
                                  value: controller.students[i].grade,
                                )
                              ],
                            ),
                            const Icon(Icons.edit)
                          ],
                        )),
                  );
                },
              ));
  }
}

class ContentItem extends StatelessWidget {
  final String label;
  final String value;
  const ContentItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: "$label : ", style: Theme.of(context).textTheme.titleLarge),
          TextSpan(
              text: value,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
