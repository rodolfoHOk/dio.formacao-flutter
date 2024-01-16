import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:trilha_inicial_app/models/registration_data_model.dart';
import 'package:trilha_inicial_app/models/task_list_store.dart';
import 'package:trilha_inicial_app/models/task_model.dart';
import 'package:trilha_inicial_app/my_app.dart';
import 'package:trilha_inicial_app/repositories/comments_repository.dart';
import 'package:trilha_inicial_app/repositories/impl/comment_dio_repository.dart';
import 'package:trilha_inicial_app/repositories/impl/post_dio_repository.dart';
import 'package:trilha_inicial_app/repositories/json_placeholder_custom_dio.dart';
import 'package:trilha_inicial_app/repositories/post_repository.dart';
import 'package:trilha_inicial_app/services/state_managers/counter_mobx_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<CounterMobXService>(CounterMobXService());
  getIt.registerSingleton<JsonPlaceholderCustomDio>(JsonPlaceholderCustomDio());
  getIt.registerSingleton<PostRepository>(
      PostDioRepository(getIt<JsonPlaceholderCustomDio>()));
  getIt.registerSingleton<CommentRepository>(
      CommentDioRepository(getIt<JsonPlaceholderCustomDio>()));
  getIt.registerSingleton<TaskListStore>(TaskListStore());
}

void setupHive() async {
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(RegistrationDataModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await dotenv.load(fileName: ".env");

  setupHive();

  setupGetIt();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('pt', 'BR'),
      child: const MyApp(),
    ),
  );
}
