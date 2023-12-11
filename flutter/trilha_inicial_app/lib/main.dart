import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilha_inicial_app/my_app.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  runApp(const MyApp());
}
