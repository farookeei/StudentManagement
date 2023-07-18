import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../widgets/bottom sheet/bottom_sheet.dart';
import '../data/student_controller.dart';
import 'add_edit_Child.dart';

class Customtable extends GetView<StudentController> {
  const Customtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isTableview.value
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                // border: TableBorder(right: BorderSide(color: Colors.black)),
                columns: const [
                  DataColumn(label: Text("Id")),
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Age")),
                  DataColumn(label: Text("Grade")),
                ],
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
        : SizedBox());
  }
}
