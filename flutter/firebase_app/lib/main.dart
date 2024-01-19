import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/main_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final remoteConfig = FirebaseRemoteConfig.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(minutes: 60),
  ));
  await remoteConfig.setDefaults(const {
    "example_param_1": 42,
    "example_param_2": 3.14159,
    "example_param_3": true,
    "example_param_4": "Hello, world!",
    "CHAT_TEXT": "Informe seu apelido",
  });
  await remoteConfig.fetchAndActivate();
  var param_4 = remoteConfig.getString("example_param_4");
  debugPrint(param_4);

  runApp(const MainApp());
}
