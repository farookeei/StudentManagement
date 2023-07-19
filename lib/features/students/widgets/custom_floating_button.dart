import 'package:flutter/material.dart';

import '../../../widgets/bottom sheet/bottom_sheet.dart';
import '../data/student_controller.dart';
import 'add_edit_Child.dart';

class AddStudents extends StatelessWidget {
  const AddStudents({
    super.key,
    required this.controller,
  });

  final StudentController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        controller.cleardata();
        controller.clearValidation();
        fixedBottomSheet(
            context: context,
            type: FixedSheetType.floating,
            child: const AddEditChild(
              isEditStudent: false,
            ));
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
