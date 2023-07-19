import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sample/features/students/widgets/list_empty.dart';

import '../../../config/const/constants.dart';
import '../../../widgets/bottom sheet/bottom_sheet.dart';
import '../data/student_controller.dart';
import 'add_edit_Child.dart';

class Customtable extends GetView<StudentController> {
  const Customtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.viewMode.value == Constants.TABLEVIEW
        ? controller.students.isEmpty
            ? const ListEmpty()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    border: TableBorder.all(
                        color: Theme.of(context).colorScheme.onSurface),
                    columns: const [
                      DataColumn(label: Text("Id")),
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Age")),
                      DataColumn(label: Text("Grade")),
                    ],
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    rows: controller.students.map((e) {
                      return DataRow(cells: [
                        DataCell(Text(e.id.toString()), showEditIcon: true,
                            onTap: () {
                          controller.clearValidation();

                          fixedBottomSheet(
                              context: context,
                              type: FixedSheetType.floating,
                              child: AddEditChild(
                                isEditStudent: true,
                                student: e,
                              ));
                        }),
                        DataCell(Text(e.name)),
                        DataCell(Text(e.age.toString())),
                        DataCell(Text(e.grade)),
                      ]);
                    }).toList()),
              )
        : const SizedBox());
  }
}
