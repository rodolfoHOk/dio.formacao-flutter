import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class ConfigurationsPage extends StatefulWidget {
  const ConfigurationsPage({super.key});

  @override
  State<ConfigurationsPage> createState() => _ConfigurationsPageState();
}

class _ConfigurationsPageState extends State<ConfigurationsPage> {
  late SharedPreferences storage;

  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController(text: "");
  bool receivePushNotification = false;
  bool darkTheme = false;

  final USERNAME_KEY = "username_key";
  final HEIGHT_KEY = "height_key";
  final RECEIVE_NOTIFICATION_KEY = "receive_notification_key";
  final DARK_THEME_KEY = "dark_theme_key";

  void initData() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = storage.getString(USERNAME_KEY) ?? "";
      heightController.text = (storage.getDouble(HEIGHT_KEY) ?? 0).toString();
      receivePushNotification =
          storage.getBool(RECEIVE_NOTIFICATION_KEY) ?? false;
      darkTheme = storage.getBool(DARK_THEME_KEY) ?? false;
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
      await storage.setDouble(HEIGHT_KEY, double.parse(heightController.text));
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
    await storage.setString(USERNAME_KEY, usernameController.text);
    await storage.setBool(RECEIVE_NOTIFICATION_KEY, receivePushNotification);
    await storage.setBool(DARK_THEME_KEY, darkTheme);
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
