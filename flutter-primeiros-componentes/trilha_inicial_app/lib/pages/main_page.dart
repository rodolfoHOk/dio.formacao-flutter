import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meu App",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.red.shade300,
        // iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(child: Text("Página principal")),
    );
  }
}
