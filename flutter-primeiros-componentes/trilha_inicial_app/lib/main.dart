import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;

  // void _generateRandomNumber() {
  //   Random randomNumber = Random();
  //   setState(() {
  //     generatedNumber = randomNumber.nextInt(1000);
  //   });
  // }

  int _generateRandomNumber() {
    Random randomNumber = Random();
    return randomNumber.nextInt(1000);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("chamando método build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu App"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(child: Text(generatedNumber.toString())),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade300,
        child: const Icon(Icons.add_reaction),
        // onPressed: _generateRandomNumber,
        onPressed: () {
          setState(() {
            generatedNumber = _generateRandomNumber();
          });
        },
      ),
    );
  }
}
