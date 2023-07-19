import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_sample/themes/color_variables.dart';
import 'package:test_sample/widgets/snackbar/custom_snackbar.dart';

import '../../../shared/database/student_database.dart';
import '../../../widgets/alert dialog/alert_dialog.dart';
import '../../../widgets/buttons/button.dart';
import '../../../widgets/form/input_fields.dart';
import '../../../widgets/form/select_field.dart';
import '../data/student_controller.dart';

class AddEditChild extends GetView<StudentController> {
  final bool isEditStudent;
  final Student? student;

  const AddEditChild({super.key, this.student, this.isEditStudent = false});

  @override
  Widget build(BuildContext context) {
    Future<void> addStudent() async {
      try {
        await controller.addStudent();
        customSnackBar(
            context: context,
            snackBarType: SnackBarType.success,
            title: "Successfully added Student");
        Navigator.pop(context);
      } catch (e) {
        if (e.toString().isNotEmpty) {
          customSnackBar(
              context: context,
              snackBarType: SnackBarType.error,
              title: e.toString());
        }
      }
    }

    Future<void> editStudent(int id) async {
      try {
        await controller.updateStudent(id: id);
        customSnackBar(
            context: context,
            snackBarType: SnackBarType.success,
            title: "Successfully updated student details");

        Navigator.pop(context);
      } catch (e) {
        if (e.toString().isNotEmpty) {
          customSnackBar(
              context: context,
              snackBarType: SnackBarType.error,
              title: e.toString());
        }
      }
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 10.w,
          top: 20.h,
          right: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  isEditStudent ? "Edit student details" : "Add student",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              isEditStudent
                  ? IconButton(
                      onPressed: () {
                        customAlertDialog(
                          iconColor: ReplyColors.orange75,
                          icon: Icons.info_outline,
                          context: context,
                          actions: [
                            CustomButton(
                                foregroundColor: ReplyColors.neutralLight,
                                backgroundColor: ReplyColors.orange50,
                                variant: ButtonVariant.secondary,
                                onTap: () async {
                                  await controller.deleteStudent(
                                      id: student!.id!);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  customSnackBar(
                                      context: context,
                                      snackBarType: SnackBarType.success,
                                      title: "Deleted Student");
                                },
                                child: Text("Remove student",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis)),
                            SizedBox(height: 8.h),
                            CustomButton(
                                variant: ButtonVariant.secondary,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No")),
                          ],
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Are you sure you want to delete this student?',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.delete))
                  : SizedBox()
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Obx(
            () => CustomTextField(
              label: "Name",
              hintText: "Enter name",
              inputColor: Theme.of(context).colorScheme.secondary,
              initialValue: isEditStudent ? student!.name.toString() : null,
              type: InputType.text,
              variant: Variant.outlined,
              errorText: controller.isNamevalid.value
                  ? null
                  : "Please enter a valid name",
              onChanged: (val) =>
                  controller.handlenameChange(val!.trim().toString()),
            ),
          ),
          SizedBox(height: 20.h),
          Obx(
            () => CustomSelectField(
              label: "Age",
              inputColor: Theme.of(context).colorScheme.secondary,
              choosenValue: isEditStudent ? student!.age.toString() : null,
              handleChange: (val) =>
                  controller.handleAgeChange(int.parse(val!.trim().toString())),
              variant: Variant.outlined,
              hintText: "Select age",
              errorText:
                  controller.isAgevalid.value ? null : "Please select an age",
              listOptions: controller.ageRange,
            ),
          ),
          SizedBox(height: 20.h),
          Obx(
            () => CustomSelectField(
              label: "Grade",
              errorText: controller.isGradevalid.value
                  ? null
                  : "Please select a grade",
              handleChange: (val) =>
                  controller.handleGradeChange(val!.trim().toString()),
              variant: Variant.outlined,
              hintText: "Select Grade",
              inputColor: Theme.of(context).colorScheme.secondary,
              choosenValue: isEditStudent ? student!.grade : null,
              listOptions: [
                SelectFieldType(label: "A+", value: "A+"),
                SelectFieldType(label: "A", value: "A"),
                SelectFieldType(label: "B+", value: "B+"),
                SelectFieldType(label: "B", value: "B"),
                SelectFieldType(label: "C+", value: "C+"),
                SelectFieldType(label: "C", value: "C"),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          CustomButton(
              onTap: isEditStudent
                  ? () async {
                      editStudent(student!.id!);
                    }
                  : () async {
                      addStudent();
                    },
              child: Text("Submit")),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}






          // Obx(
          //   () => CustomTextField(
          //     label: "Name",
          //     hintText: "Enter name",
          //     initialValue: isEditStudent ? student!.name.toString() : null,
          //     type: InputType.text,
          //     variant: Variant.outlined,
          //     errorText: controller.validateName(),
          //     onChanged: (val) =>
          //         controller.handlenameChange(val!.trim().toString()),
          //   ),
          // ),
          // SizedBox(height: 20.h),
          // Obx(
          //   () => CustomSelectField(
          //     label: "Age",
          //     choosenValue: isEditStudent ? student!.age.toString() : null,
          //     handleChange: (val) =>
          //         controller.handleAgeChange(int.parse(val!.trim().toString())),
          //     variant: Variant.outlined,
          //     hintText: "Select age",
          //     errorText: controller.validateAge(),
          //     listOptions: controller.ageRange,
          //   ),
          // ),
          // SizedBox(height: 20.h),
          // Obx(
          //   () => CustomSelectField(
          //     label: "Grade",
          //     errorText: controller.validateGrade(),
          //     handleChange: (val) =>
          //         controller.handleGradeChange(val!.trim().toString()),
          //     variant: Variant.outlined,
          //     hintText: "Select Grade",
          //     choosenValue: isEditStudent ? student!.grade : null,
          //     listOptions: [
          //       SelectFieldType(label: "A+", value: "A+"),
          //       SelectFieldType(label: "A", value: "A"),
          //       SelectFieldType(label: "B+", value: "B+"),
          //       SelectFieldType(label: "B", value: "B"),
          //       SelectFieldType(label: "C+", value: "C+"),
          //       SelectFieldType(label: "C", value: "C"),
          //     ],
          //   ),
          // ),
