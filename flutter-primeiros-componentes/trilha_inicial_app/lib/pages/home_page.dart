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
      body: Center(
          child: Text(
        generatedNumber.toString(),
        style: const TextStyle(fontSize: 20),
        // style: GoogleFonts.acme(fontSize: 20),
      )),
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
