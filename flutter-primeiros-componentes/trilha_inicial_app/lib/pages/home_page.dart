import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilha_inicial_app/services/random_number_generator_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;
  var clicksQuantity = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("chamando método build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu App",
          style: GoogleFonts.pacifico(),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.maxFinite,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Ações do usuário",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Foi clicado $clicksQuantity vezes",
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "O número gerado foi: $generatedNumber",
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.red,
                    child: const Text(
                      "10",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: const Text(
                      "20",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: const Text(
                      "30",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade300,
        child: const Icon(Icons.add_reaction),
        onPressed: () {
          setState(() {
            clicksQuantity = clicksQuantity + 1;
            generatedNumber =
                RandomNumberGeneratorService.generateRandomNumber(1000);
          });
        },
      ),
    );
  }
}
