import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: const Color(0xffffffff),
      backgroundColor: const Color.fromARGB(255, 236, 242, 248),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 64,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.amber,
            ),
            const SizedBox(
              height: 48,
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.green,
              height: 32,
              alignment: Alignment.center,
              child: const Text("Informe seu e-mail:"),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.green,
              height: 32,
              alignment: Alignment.center,
              child: const Text("Informe a senha:"),
            )
          ],
        ),
      ),
    ));
  }
}
