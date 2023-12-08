import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilha_inicial_app/services/app_storage_service.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({super.key});

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  int generatedNumber = 0;
  int clickCounter = 0;

  late AppStorageService appStorageService;

  void loadData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    appStorageService = AppStorageService(sharedPreferences);
    setState(() {
      generatedNumber = appStorageService.getRandomNumber();
      clickCounter = appStorageService.getClickCounter();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Gerador de números aleatórios"),
        body: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              generatedNumber.toString(),
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              clickCounter.toString(),
              style: const TextStyle(fontSize: 18),
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(side: BorderSide.none),
          onPressed: () async {
            var random = Random();
            setState(() {
              generatedNumber = random.nextInt(1000);
              clickCounter = clickCounter + 1;
            });
            await appStorageService.setRandomNumber(generatedNumber);
            await appStorageService.setClickCounter(clickCounter);
          },
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
