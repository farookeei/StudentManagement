import 'package:get/get.dart';

import '../../features/students/data/student_controller.dart';
import '../controllers/theme_controller.dart';
import '../database/student_database.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentController());
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => StudentDatabase());
  }
}
