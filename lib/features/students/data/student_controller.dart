import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_sample/config/const/constants.dart';

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

  final viewMode = Constants().viewMode.first.obs;

  final isNamevalid = true.obs;
  final isAgevalid = true.obs;
  final isGradevalid = true.obs;

  var ageRange = [
    for (var i = 6; i <= 21; i++)
      SelectFieldType(label: '$i years', value: "$i")
  ];

  void updateDataView(String val) {
    log(val);
    viewMode.value = val;
  }

  void handlenameChange(String data) {
    name.value = data;
  }

  void handleAgeChange(int data) {
    age.value = data;
  }

  void handleGradeChange(String data) {
    grade.value = data;
  }

  cleardata() {
    grade.value = "";
    age.value = 0;
    name.value = "";
  }

  clearValidation() {
    isAgevalid.value = true;
    isGradevalid.value = true;
    isNamevalid.value = true;
  }

  bool validateName() {
    if (name.value.isEmpty || name.value.length < 4) {
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
