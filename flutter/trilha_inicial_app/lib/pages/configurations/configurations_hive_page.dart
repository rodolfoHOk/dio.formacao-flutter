import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/configurations_model.dart';
import 'package:trilha_inicial_app/services/configurations_repository.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class ConfigurationsHivePage extends StatefulWidget {
  const ConfigurationsHivePage({super.key});

  @override
  State<ConfigurationsHivePage> createState() => _ConfigurationsHivePageState();
}

class _ConfigurationsHivePageState extends State<ConfigurationsHivePage> {
  late ConfigurationsRepository configurationsRepository;
  ConfigurationsModel configurationsModel = ConfigurationsModel.blank();

  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController(text: "");

  void initData() async {
    configurationsRepository = await ConfigurationsRepository.load();
    configurationsModel = configurationsRepository.getData();
    usernameController.text = configurationsModel.username;
    heightController.text = configurationsModel.height.toString();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> saveData(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var height = double.tryParse(heightController.text);
      configurationsModel.height = (height ?? 0.0);
    } catch (e) {
      if (context.mounted) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text("Meu App"),
                content: const Text("Favor informar uma altura válida"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"))
                ],
              );
            });
        return;
      }
    }
    configurationsModel.username = usernameController.text;
    configurationsRepository.save(configurationsModel);
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(title: "Configurações"),
          body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: ListView(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    decoration:
                        const InputDecoration(hintText: "Nome do usuário"),
                    controller: usernameController,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Altura"),
                    controller: heightController,
                  ),
                ),
                SwitchListTile(
                    title: const Text("Receber notificações"),
                    value: configurationsModel.receiveNotification,
                    onChanged: (bool value) {
                      setState(() {
                        configurationsModel.receiveNotification = value;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Tema escuro"),
                    value: configurationsModel.darkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        configurationsModel.darkTheme = value;
                      });
                    }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton(
                      onPressed: () => saveData(context),
                      child: const Text("Salvar")),
                )
              ]))),
    );
  }
}
