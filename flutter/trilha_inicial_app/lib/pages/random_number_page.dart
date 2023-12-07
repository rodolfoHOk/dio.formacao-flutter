import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({super.key});

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  int generatedNumber = 0;
  int clickCounter = 0;

  // ignore: non_constant_identifier_names
  final RANDOM_NUMBER_KEY = "random_number";
  // ignore: non_constant_identifier_names
  final CLICK_COUNTER_KEY = "click_counter";

  late SharedPreferences storage;

  void fetchData() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      generatedNumber = storage.getInt(RANDOM_NUMBER_KEY) ?? 0;
      clickCounter = storage.getInt(CLICK_COUNTER_KEY) ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
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
            await storage.setInt(RANDOM_NUMBER_KEY, generatedNumber);
            await storage.setInt(CLICK_COUNTER_KEY, clickCounter);
            // storage.remove(randomNumberKey); // for teste 0
          },
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
