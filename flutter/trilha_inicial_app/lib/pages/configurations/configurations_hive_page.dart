import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilha_inicial_app/services/app_storage_service.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class ConfigurationsHivePage extends StatefulWidget {
  const ConfigurationsHivePage({super.key});

  @override
  State<ConfigurationsHivePage> createState() => _ConfigurationsHivePageState();
}

class _ConfigurationsHivePageState extends State<ConfigurationsHivePage> {
  late AppStorageService appStorageService;

  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController(text: "");
  bool receivePushNotification = false;
  bool darkTheme = false;

  void initData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    appStorageService = AppStorageService(sharedPreferences);
    setState(() {
      usernameController.text = appStorageService.getConfigurationUsername();
      heightController.text =
          appStorageService.getConfigurationHeight().toString();
      receivePushNotification =
          appStorageService.getConfigurationReceiveNotification();
      darkTheme = appStorageService.getConfigurationDarkTheme();
    });
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
      await appStorageService.setConfigurationHeight(height ?? 0.0);
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
    await appStorageService.setConfigurationUsername(usernameController.text);
    await appStorageService
        .setConfigurationReceiveNotification(receivePushNotification);
    await appStorageService.setConfigurationDarkTheme(darkTheme);
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
                    value: receivePushNotification,
                    onChanged: (bool value) {
                      setState(() {
                        receivePushNotification = value;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Tema escuro"),
                    value: darkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        darkTheme = value;
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
