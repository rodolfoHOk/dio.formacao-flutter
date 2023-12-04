import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/shared/widgets/text_label.dart';

class RegistrationDataPage extends StatefulWidget {
  const RegistrationDataPage({super.key});

  @override
  State<RegistrationDataPage> createState() => _RegistrationDataPageState();
}

class _RegistrationDataPageState extends State<RegistrationDataPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController birthdayController = TextEditingController(text: "");

  DateTime? birthday;

  // Text returnText(String text) {
  //   return Text(
  //     text,
  //     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Meus dados",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // returnText("Nome"),
            const TextLabel(text: "Nome"),
            TextField(
              controller: nameController,
            ),
            const SizedBox(height: 12),
            // returnText("Data de nascimento"),
            const TextLabel(text: "Data de nascimento"),
            TextField(
              readOnly: true,
              controller: birthdayController,
              onTap: () async {
                var day = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime(2024, 12, 04));
                if (day != null) {
                  birthdayController.text = day.toString();
                  birthday = day;
                }
              },
            ),
            const SizedBox(height: 12),
            TextButton(
                onPressed: () {
                  debugPrint(nameController.text);
                  debugPrint(birthday.toString());
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
