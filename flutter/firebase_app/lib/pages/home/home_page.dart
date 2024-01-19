import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_app/shared/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteConfig = FirebaseRemoteConfig.instance;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(int.parse(
            "0xff${remoteConfig.getString("BACKGROUND_SCREEN_COLOR")}")),
        appBar: AppBar(
          title: const Text("Firebase App"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        drawer: const CustomDrawer(),
        body: const Center(
          child: Text(
            "Acesse o menu",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
