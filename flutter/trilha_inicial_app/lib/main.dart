import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilha_inicial_app/models/registration_data_model.dart';
import 'package:trilha_inicial_app/models/task_model.dart';
import 'package:trilha_inicial_app/my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(RegistrationDataModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  runApp(const MyApp());
}
