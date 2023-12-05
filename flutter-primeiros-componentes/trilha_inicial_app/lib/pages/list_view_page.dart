import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user3),
          title: const Text("Usuário 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Olá, tudo bem?"), Text("12:04")],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              if (menu == "option2") {
                debugPrint("Is option 2");
              }
              debugPrint(menu);
            },
            itemBuilder: (BuildContext builder) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "option1", child: Text("Opção 1")),
                const PopupMenuItem<String>(
                    value: "option2", child: Text("Opção 2")),
                const PopupMenuItem<String>(
                    value: "option3", child: Text("Opção 3")),
              ];
            },
          ),
          // subtitle: const Text("Olá, tudo bem?\nPode falar?"),
          // isThreeLine: true,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.user1,
          height: 128,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.user2,
          height: 128,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.user3,
          height: 128,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.paisagem1,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.paisagem2,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.paisagem3,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
