import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class RandomNumberHivePage extends StatefulWidget {
  const RandomNumberHivePage({super.key});

  @override
  State<RandomNumberHivePage> createState() => _RandomNumberHivePageState();
}

class _RandomNumberHivePageState extends State<RandomNumberHivePage> {
  int generatedNumber = 0;
  int clickCounter = 0;

  late Box randomNumbersBox;

  void loadData() async {
    if (Hive.isBoxOpen('random_numbers_box')) {
      randomNumbersBox = Hive.box('random_numbers_box');
    } else {
      randomNumbersBox = await Hive.openBox('random_numbers_box');
    }
    setState(() {
      generatedNumber = randomNumbersBox.get('generatedNumber') ?? 0;
      clickCounter = randomNumbersBox.get('clickCounter') ?? 0;
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
        appBar: const CustomAppBar(title: "Números aleatórios - Hive"),
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
          onPressed: () {
            var random = Random();
            setState(() {
              generatedNumber = random.nextInt(1000);
              clickCounter = clickCounter + 1;
            });
            randomNumbersBox.put('generatedNumber', generatedNumber);
            randomNumbersBox.put('clickCounter', clickCounter);
          },
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
