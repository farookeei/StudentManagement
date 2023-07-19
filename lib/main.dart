import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_sample/shared/database/student_database.dart';

import 'app/view/app.dart';
import 'config/env/env_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Environment().initConfig("DEV");
  GetStorage.init();
  StudentDatabase().initializeDatabase();

  runApp(const MyApp());
}
