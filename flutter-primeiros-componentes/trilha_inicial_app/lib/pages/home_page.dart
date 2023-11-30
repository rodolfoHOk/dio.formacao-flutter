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
              Expanded(
                  child: Container(
                width: double.maxFinite,
                color: Colors.cyan,
                child: const Text(
                  "Ações do usuário",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
              Expanded(
                  flex: 3,
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.orange,
                    child: Text(
                      "Foi clicado $clicksQuantity vezes",
                      style: const TextStyle(fontSize: 20),
                    ),
                  )),
              Container(
                width: double.maxFinite,
                color: Colors.indigo,
                child: Text(
                  "O número gerado foi: $generatedNumber",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              // alignment: Alignment.center,
                              color: Colors.red,
                              child: const Text(
                                "Nome:",
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Container(
                              // alignment: Alignment.center,
                              color: Colors.blue,
                              child: const Text(
                                "Rodolfo HiOk",
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              // alignment: Alignment.center,
                              color: Colors.green,
                              child: const Text(
                                "30",
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      ],
                    )),
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
