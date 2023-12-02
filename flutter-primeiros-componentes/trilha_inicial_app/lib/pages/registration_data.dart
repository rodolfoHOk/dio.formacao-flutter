import 'package:flutter/material.dart';

class RegistrationDataPage extends StatelessWidget {
  final String text;
  final List<String> data;

  const RegistrationDataPage(
      {super.key, required this.text, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Center(
        child: Text(data.length.toString()),
      ),
    );
  }
}
