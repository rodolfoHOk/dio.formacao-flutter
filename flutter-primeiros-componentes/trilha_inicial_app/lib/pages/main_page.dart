import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/page1.dart';
import 'package:trilha_inicial_app/pages/page2.dart';
import 'package:trilha_inicial_app/pages/page3.dart';
import 'package:trilha_inicial_app/pages/registration_data.dart';

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
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationDataPage(
                                  text: "Meus dados",
                                  data: ["Nome", "Endereço"],
                                )));
                  },
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
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  // scrollDirection: Axis.vertical,
                  children: const [Page1Page(), Page2Page(), Page3Page()]),
            ),
          ],
        ),
      ),
    );
  }
}
