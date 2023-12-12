import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilha_inicial_app/repositories/language_repository.dart';
import 'package:trilha_inicial_app/repositories/level_repository.dart';
import 'package:trilha_inicial_app/services/app_storage_service.dart';
import 'package:trilha_inicial_app/shared/widgets/text_label.dart';

class RegistrationSharedPreferencesDataPage extends StatefulWidget {
  const RegistrationSharedPreferencesDataPage({super.key});

  @override
  State<RegistrationSharedPreferencesDataPage> createState() =>
      _RegistrationSharedPreferencesDataPageState();
}

class _RegistrationSharedPreferencesDataPageState
    extends State<RegistrationSharedPreferencesDataPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController birthdayController = TextEditingController(text: "");
  DateTime? birthday;
  var levelRepository = LevelRepository();
  var levels = [];
  var selectedLevel = "";
  var languageRepository = LanguageRepository();
  var languages = [];
  var selectedLanguages = <String>[];
  double chosenSalary = 0.0;
  int experienceTime = 0;

  late AppStorageService appStorageService;

  bool saving = false;

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

  void loadData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    appStorageService = AppStorageService(sharedPreferences);
    nameController.text = appStorageService.getRegistrationDataName();
    birthday = appStorageService.getRegistrationDataBirthday();
    birthdayController.text = birthday!.toIso8601String();
    selectedLevel = appStorageService.getRegistrationDataExperienceLevel();
    selectedLanguages = appStorageService.getRegistrationDataLanguages();
    experienceTime = appStorageService.getRegistrationDataExperienceTime();
    chosenSalary = appStorageService.getRegistrationDataSalary();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    levels = levelRepository.getLevels();
    languages = languageRepository.getLanguages();
    loadData();
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
        child: saving
            ? const Center(child: CircularProgressIndicator())
            : ListView(
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
                      onPressed: () async {
                        if (nameController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Nome deve ter ao menos 3 caracteres"),
                                  backgroundColor: Colors.red));
                          return;
                        }

                        if (birthday == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Data de nascimento deve ser preenchida"),
                                  backgroundColor: Colors.red));
                          return;
                        }

                        if (selectedLevel.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Nível de experiência não foi selecionado"),
                                  backgroundColor: Colors.red));
                          return;
                        }

                        if (selectedLanguages.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Nenhuma linguagem foi selecionada"),
                                  backgroundColor: Colors.red));
                          return;
                        }

                        if (selectedLanguages.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Nenhuma linguagem foi selecionada"),
                                  backgroundColor: Colors.red));
                          return;
                        }

                        if (experienceTime == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ter ao menos 1 ano de experiência em alguma linguagem"),
                              backgroundColor: Colors.red));
                          return;
                        }

                        if (chosenSalary == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretensão salarial deve ser maior que zero"),
                              backgroundColor: Colors.red));
                          return;
                        }

                        await appStorageService
                            .setRegistrationDataName(nameController.text);
                        await appStorageService
                            .setRegistrationDataBirthday(birthday!);
                        await appStorageService
                            .setRegistrationDataExperienceLevel(selectedLevel);
                        await appStorageService
                            .setRegistrationDataLanguages(selectedLanguages);
                        await appStorageService
                            .setRegistrationDataExperienceTime(experienceTime);
                        await appStorageService
                            .setRegistrationDataSalary(chosenSalary);

                        setState(() {
                          saving = true;
                        });

                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            saving = false;
                          });
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Dados salvos com sucesso"),
                                  backgroundColor: Colors.green));
                        });
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}
