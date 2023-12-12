import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/configurations/configurations_hive_page.dart';
import 'package:trilha_inicial_app/pages/login_page.dart';
import 'package:trilha_inicial_app/pages/random_number/random_number_hive_page.dart';
import 'package:trilha_inicial_app/pages/registration_data/registration_data_hive_page%20.dart';

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
              currentAccountPicture: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      context: context,
                      builder: (BuildContext builder) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Wrap(
                            children: [
                              ListTile(
                                title: const Text("Câmera"),
                                leading: const Icon(Icons.photo_camera),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: const Text("Galeria"),
                                leading: const Icon(Icons.photo_library),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
              ),
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
                      builder: (context) => const RegistrationDataHivePage()));
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
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  context: context,
                  builder: (BuildContext builder) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Termos de uso e privacidade",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close))
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Não obstante, a determinação clara de objetivos causa impacto indireto na reavaliação das formas de ação. Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o comprometimento entre as equipes promove a alavancagem do investimento em reciclagem técnica. Pensando mais a longo prazo, o fenômeno da Internet ainda não demonstrou convincentemente que vai participar na mudança dos modos de operação convencionais. Desta maneira, a consolidação das estruturas talvez venha a ressaltar a relatividade dos métodos utilizados na avaliação de resultados. O que temos que ter sempre em mente é que a contínua expansão de nossa atividade auxilia a preparação e a composição de todos os recursos funcionais envolvidos.",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                  });
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
                    Icon(Icons.build_outlined),
                    SizedBox(width: 8),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) =>
                          const ConfigurationsHivePage()));
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
                      Icon(Icons.numbers),
                      SizedBox(width: 8),
                      Text("Gerador de números"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext builder) =>
                            const RandomNumberHivePage()));
              }),
          const Divider(),
          InkWell(
            child: Container(
                width: double.maxFinite,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app_outlined),
                    SizedBox(width: 8),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext builder) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      title: const Text(
                        "Meu App",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(children: [
                        Text("Você sairá do aplicativo!"),
                        Text("Deseja realmente sair do aplicativo?"),
                      ]),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sim"))
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
