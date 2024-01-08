import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import 'package:trilha_inicial_app/pages/Interatividade_app_flutter/battery_page.dart';
import 'package:trilha_inicial_app/pages/configurations/configurations_hive_page.dart';
import 'package:trilha_inicial_app/pages/characteres_page.dart';
import 'package:trilha_inicial_app/pages/login_page.dart';
import 'package:trilha_inicial_app/pages/posts_page.dart';
import 'package:trilha_inicial_app/pages/random_number/random_number_hive_page.dart';
import 'package:trilha_inicial_app/pages/registration_data/registration_data_hive_page%20.dart';
import 'package:trilha_inicial_app/pages/tasks/task_http_page.dart';
import 'package:trilha_inicial_app/pages/visuals_packages/auto_size_text_page.dart';
import 'package:trilha_inicial_app/pages/visuals_packages/bottom_bar_page.dart';
import 'package:trilha_inicial_app/pages/visuals_packages/pertcent_indicator_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
                    },
                  );
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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.bookOpen,
                    color: Colors.deepOrange,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("Dados cadastrais"),
                ],
              ),
            ),
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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  Icon(Icons.article_outlined),
                  SizedBox(width: 8),
                  Text("Termos de uso e privacidade"),
                ],
              ),
            ),
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
                },
              );
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
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(width: 8),
                  Text("Posts"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) => const PostsPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  Icon(Icons.military_tech),
                  SizedBox(width: 8),
                  Text("Heróis"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) =>
                          const CharactersPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  Icon(Icons.task),
                  SizedBox(width: 8),
                  Text("Tarefas HTTP"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) => const TaskHTTPPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.percent,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("Indicador de porcentagem"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) =>
                          const PercentIndicatorPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.autoprefixer,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("Auto size text"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) =>
                          const AutoSizeTextPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.ship,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("Bottom bar"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) =>
                          const BottomBarPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.flag,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("Intl"),
                ],
              ),
            ),
            onTap: () {
              var f = NumberFormat('#,###.0#', 'en_US');
              var fBr = NumberFormat('#,###.0#', 'pt_BR');
              debugPrint(f.format(12345.678));
              debugPrint(fBr.format(12345.678));

              initializeDateFormatting();
              var date = DateTime(2023, 12, 21);
              var fd1 = DateFormat('EEEE', 'en_US');
              debugPrint(fd1.format(date));
              var fd2 = DateFormat('EEEE', 'pt_BR');
              debugPrint(fd2.format(date));
              Intl.defaultLocale = 'pt_BR';
              debugPrint(date.toString());
              debugPrint(DateFormat.yMd().format(date));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.houseFlag,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("pt-BR"),
                ],
              ),
            ),
            onTap: () {
              if (context.locale == const Locale('pt', 'BR')) {
                context.setLocale(const Locale('en', 'US'));
              } else {
                context.setLocale(const Locale('pt', 'BR'));
              }
              Navigator.pop(context);
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.batteryHalf,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("Status da Bateria"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) => const BatteryPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.school,
                    color: Colors.purple,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("Abrir DIO"),
                ],
              ),
            ),
            onTap: () async {
              var url = Uri.parse('https://web.dio.me/');
              await launchUrl(url);
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.mapLocationDot,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("Abrir Google Maps"),
                ],
              ),
            ),
            onTap: () async {
              var url = Uri.parse("google.navigation:q=Orlando FL&mode=d");
              await launchUrl(url);
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.shareNodes,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text("Compartilhar"),
                ],
              ),
            ),
            onTap: () {
              Share.share('Dê uma olhada neste site: https://dio.me');
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  Icon(
                    Icons.exit_to_app_outlined,
                  ),
                  SizedBox(width: 8),
                  Text("Sair"),
                ],
              ),
            ),
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
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
