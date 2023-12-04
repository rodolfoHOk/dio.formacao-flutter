import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/repositories/language_repository.dart';
import 'package:trilha_inicial_app/repositories/level_repository.dart';
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
  var levelRepository = LevelRepository();
  var levels = [];
  var selectedLevel = "";
  var languageRepository = LanguageRepository();
  var languages = [];
  var selectedLanguages = [];
  double chosenSalary = 0.0;
  int experienceTime = 0;

  String getLevelTitle(String level) {
    switch (level) {
      case "beginner":
        return "Iniciante";
      case "intermediate":
        return "Intermediário";
      case "advanced":
        return "Avançado";
      default:
        return "Nome do nível inválido";
    }
  }

  List<DropdownMenuItem<int>> getDropdownItens(int maxQuantity) {
    var itens = <DropdownMenuItem<int>>[];
    for (int i = 0; i <= maxQuantity; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  void initState() {
    levels = levelRepository.getLevels();
    languages = languageRepository.getLanguages();
    super.initState();
  }

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
        child: ListView(
          children: [
            const TextLabel(text: "Nome"),
            TextField(
              controller: nameController,
            ),
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
            const TextLabel(text: "Nível de experiência"),
            Column(
                children: levels
                    .map((level) => RadioListTile(
                        dense: true,
                        activeColor: Colors.blue.shade600,
                        title: Text(getLevelTitle(level.toString())),
                        selected: selectedLevel == level.toString(),
                        value: level.toString(),
                        groupValue: selectedLevel,
                        onChanged: (value) {
                          setState(() {
                            selectedLevel = value.toString();
                          });
                        }))
                    .toList()),
            const TextLabel(text: "Linguagens preferidas"),
            Column(
                children: languages
                    .map((language) => CheckboxListTile(
                        dense: true,
                        title: Text(language.toString()),
                        value: selectedLanguages.contains(language),
                        onChanged: (bool? value) {
                          if (value!) {
                            setState(() {
                              selectedLanguages.add(language);
                            });
                          } else {
                            setState(() {
                              selectedLanguages.remove(language);
                            });
                          }
                        }))
                    .toList()),
            const TextLabel(text: "Tempo de experiência"),
            DropdownButton(
                isExpanded: true,
                value: experienceTime,
                items: getDropdownItens(50),
                onChanged: (value) {
                  setState(() {
                    experienceTime = value ?? 0;
                  });
                }),
            TextLabel(
                text:
                    "Pretensão salarial. R\$ ${chosenSalary.round().toString()}"),
            Slider(
                min: 0,
                max: 10000,
                value: chosenSalary,
                onChanged: (double value) {
                  setState(() {
                    chosenSalary = value;
                  });
                }),
            const SizedBox(height: 12),
            TextButton(
                onPressed: () {
                  debugPrint(nameController.text);
                  debugPrint(birthday.toString());
                  debugPrint(selectedLevel);
                  debugPrint(selectedLanguages.toString());
                  debugPrint(experienceTime.toString());
                  debugPrint(chosenSalary.round().toString());
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
