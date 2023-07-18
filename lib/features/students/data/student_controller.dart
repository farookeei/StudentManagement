import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_sample/widgets/snackbar/custom_snackbar.dart';

import '../../../shared/database/student_database.dart';
import '../../../widgets/form/select_field.dart';

class StudentController extends GetxController {
  StudentController() {
    returnStudents();
  }
  final StudentDatabase studentDatabase = Get.find<StudentDatabase>();

  final students = <Student>[].obs;
  final name = "".obs;
  final age = 0.obs;
  final grade = "".obs;
  final isTableview = true.obs;
  final isNamevalid = true.obs;
  final isAgevalid = true.obs;
  final isGradevalid = true.obs;

  var ageRange = [
    for (var i = 6; i <= 18; i++)
      SelectFieldType(label: '$i years', value: "$i")
  ];

  void updateDataView() {
    isTableview.value = !isTableview.value;
  }

  void handlenameChange(String data) {
    name.value = data;
    // validateName();
  }

  void handleAgeChange(int data) {
    age.value = data;
    //  validateAge();
  }

  void handleGradeChange(String data) {
    grade.value = data;
    // validateGrade();
  }

  cleardata() {
    grade.value = "";
    age.value = 0;
    name.value = "";
    //!!!!!!TODO    remove validation logic
  }

  clearValidation() {
    isAgevalid.value = true;
    isGradevalid.value = true;
    isNamevalid.value = true;
  }

  bool validateName() {
    if (name.value.isEmpty || name.value.length < 3) {
      return isNamevalid.value = false;
    }
    return isNamevalid.value = true;
  }

  bool validateAge() {
    if (age.value == 0) {
      return isAgevalid.value = false;
    }
    return isAgevalid.value = true;
  }

  bool validateGrade() {
    if (grade.value.isEmpty) {
      return isGradevalid.value = false;
    }
    return isGradevalid.value = true;
  }

  // String? validateName() {
  //   if (name.value.isEmpty) {
  //     return 'Please enter a name';
  //   }
  //   return null;
  // }

  // String? validateAge() {
  //   if (age.value == 0) {
  //     return 'Please select an age';
  //   }
  //   return null;
  // }

  // String? validateGrade() {
  //   if (grade.value.isEmpty) {
  //     return 'Please select a grade';
  //   }
  //   return null;
  // }

  Future<void> returnStudents() async {
    students.value = await studentDatabase.retrieveStudents();
  }

  Future<void> addStudent() async {
    validateName();
    validateGrade();
    validateAge();
    try {
      if (validateName() && validateGrade() && validateAge()) {
        await studentDatabase.insertStudent(
            Student(name: name.value, age: age.value, grade: grade.value));
        await returnStudents();
      } else {
        throw '';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteStudent({required int id}) async {
    try {
      await studentDatabase.deleteStudent(id);
      await returnStudents();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateStudent({required int id}) async {
    try {
      validateName();
      if (validateName()) {
        await studentDatabase.updateStudent(Student(
            id: id, name: name.value, age: age.value, grade: grade.value));
        await returnStudents();
      } else {
        throw '';
      }
    } catch (e) {
      rethrow;
    }
  }
}
