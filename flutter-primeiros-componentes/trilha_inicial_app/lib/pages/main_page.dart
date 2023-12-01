import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Main Page",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: const Text("Dados cadastrais")),
                  onTap: () {},
                ),
                const Divider(),
                SizedBox(height: 10, child: Container()),
                InkWell(
                  child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: const Text("Termos de uso e privacidade")),
                  onTap: () {},
                ),
                const Divider(),
                SizedBox(height: 10, child: Container()),
                InkWell(
                  child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: const Text("Configurações")),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: const Center(child: Text("Página principal")),
      ),
    );
  }
}
