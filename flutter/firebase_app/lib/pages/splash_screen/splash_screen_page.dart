import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  void openHome() async {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    await analytics.logEvent(name: "SplashScreenOpen");
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getString('user_id');
    if (userId == null) {
      Uuid uuid = const Uuid();
      userId = uuid.v4();
      await preferences.setString('user_id', userId);
    }
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  void initState() {
    super.initState();
    openHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
