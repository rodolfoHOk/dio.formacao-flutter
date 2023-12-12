import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/registration_data_model.dart';
import 'package:trilha_inicial_app/repositories/language_repository.dart';
import 'package:trilha_inicial_app/repositories/level_repository.dart';
import 'package:trilha_inicial_app/repositories/registration_data_repository.dart';
import 'package:trilha_inicial_app/shared/widgets/text_label.dart';

class RegistrationDataHivePage extends StatefulWidget {
  const RegistrationDataHivePage({super.key});

  @override
  State<RegistrationDataHivePage> createState() =>
      _RegistrationDataHivePageState();
}

class _RegistrationDataHivePageState extends State<RegistrationDataHivePage> {
  late RegistrationDataRepository registrationDataRepository;
  RegistrationDataModel registrationDataModel = RegistrationDataModel.blank();

  var levelRepository = LevelRepository();
  var languageRepository = LanguageRepository();
  var levels = [];
  var languages = [];

  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController birthdayController = TextEditingController(text: "");

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
    registrationDataRepository = await RegistrationDataRepository.load();
    registrationDataModel = registrationDataRepository.getData();
    nameController.text = registrationDataModel.name ?? "";
    birthdayController.text = registrationDataModel.birthday?.toString() ?? "";
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
                        registrationDataModel.birthday = day;
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
                              selected: registrationDataModel.experienceLevel ==
                                  level.toString(),
                              value: level.toString(),
                              groupValue: registrationDataModel.experienceLevel,
                              onChanged: (value) {
                                setState(() {
                                  registrationDataModel.experienceLevel =
                                      value.toString();
                                });
                              }))
                          .toList()),
                  const TextLabel(text: "Linguagens preferidas"),
                  Column(
                      children: languages
                          .map((language) => CheckboxListTile(
                              dense: true,
                              title: Text(language.toString()),
                              value: registrationDataModel.languages
                                  .contains(language),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    registrationDataModel.languages
                                        .add(language);
                                  });
                                } else {
                                  setState(() {
                                    registrationDataModel.languages
                                        .remove(language);
                                  });
                                }
                              }))
                          .toList()),
                  const TextLabel(text: "Tempo de experiência"),
                  DropdownButton(
                      isExpanded: true,
                      value: registrationDataModel.experienceTime,
                      items: getDropdownItens(50),
                      onChanged: (value) {
                        setState(() {
                          registrationDataModel.experienceTime = value ?? 0;
                        });
                      }),
                  TextLabel(
                      text:
                          "Pretensão salarial. R\$ ${registrationDataModel.salary?.round().toString()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: registrationDataModel.salary ?? 0,
                      onChanged: (double value) {
                        setState(() {
                          registrationDataModel.salary = value;
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

                        if (registrationDataModel.birthday == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Data de nascimento deve ser preenchida"),
                                  backgroundColor: Colors.red));
                          return;
                        }

                        if (registrationDataModel.experienceLevel == null ||
                            registrationDataModel.experienceLevel?.trim() ==
                                "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Nível de experiência não foi selecionado"),
                                  backgroundColor: Colors.red));
                          return;
                        }

                        if (registrationDataModel.languages.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Nenhuma linguagem foi selecionada"),
                                  backgroundColor: Colors.red));
                          return;
                        }

                        if (registrationDataModel.experienceTime == null ||
                            registrationDataModel.experienceTime == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ter ao menos 1 ano de experiência em alguma linguagem"),
                              backgroundColor: Colors.red));
                          return;
                        }

                        if (registrationDataModel.salary == null ||
                            registrationDataModel.salary == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretensão salarial deve ser maior que zero"),
                              backgroundColor: Colors.red));
                          return;
                        }

                        registrationDataModel.name = nameController.text;
                        registrationDataRepository.save(registrationDataModel);

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
