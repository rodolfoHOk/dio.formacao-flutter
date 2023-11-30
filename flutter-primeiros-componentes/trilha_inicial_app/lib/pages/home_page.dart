import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/services/random_number_generator_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("chamando método build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu App"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(child: Text(generatedNumber.toString())),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade300,
        child: const Icon(Icons.add_reaction),
        onPressed: () {
          setState(() {
            generatedNumber =
                RandomNumberGeneratorService.generateRandomNumber(1000);
          });
        },
      ),
    );
  }
}
