import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/registration_data.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepOrange),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
              accountName: const Text("Rudolf HiOk"),
              accountEmail: const Text("hioktec@gmail.com")),
          InkWell(
            child: Container(
                width: double.maxFinite,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: const Row(
                  children: [
                    Icon(Icons.menu_book_outlined),
                    SizedBox(width: 8),
                    Text("Dados cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationDataPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                width: double.maxFinite,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: const Row(
                  children: [
                    Icon(Icons.article_outlined),
                    SizedBox(width: 8),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          InkWell(
            child: Container(
                width: double.maxFinite,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: const Row(
                  children: [
                    Icon(Icons.build_outlined),
                    SizedBox(width: 8),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
