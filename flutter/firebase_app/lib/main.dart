import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/main_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.setDefaults(const {
    "example_param_1": 42,
    "example_param_2": 3.14159,
    "example_param_3": true,
    "example_param_4": "Hello, world!",
  });
  await remoteConfig.fetchAndActivate();
  var param_4 = remoteConfig.getString("example_param_4");
  debugPrint(param_4);

  runApp(const MainApp());
}
