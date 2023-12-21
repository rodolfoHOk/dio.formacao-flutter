import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:trilha_inicial_app/pages/login_page.dart';

class SplashScreenDelayPage extends StatefulWidget {
  const SplashScreenDelayPage({super.key});

  @override
  State<SplashScreenDelayPage> createState() => _SplashScreenDelayPageState();
}

class _SplashScreenDelayPageState extends State<SplashScreenDelayPage> {
  void openLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    openLogin();
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple, Colors.indigo],
              stops: [0.2, 0.8],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 56),
                SizedBox(
                  height: 56,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                const SizedBox(height: 256),
                SizedBox(
                  width: 300.0,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Meu App Flutter!',
                        textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        speed: const Duration(milliseconds: 150),
                      ),
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 300),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
