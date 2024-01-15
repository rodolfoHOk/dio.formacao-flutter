import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilha_inicial_app/services/counter_service.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build page"); // não imprime
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<CounterService>(builder: (context, counterService, widget) {
          debugPrint("build consumer"); // imprime
          return Text(
            counterService.counter.toString(),
            style: const TextStyle(fontSize: 24),
          );
        }),
        ElevatedButton(
          onPressed: () {
            var counterService =
                Provider.of<CounterService>(context, listen: false);
            counterService.increment();
          },
          child: const Text("Incrementar"),
        )
      ],
    );
  }
}
