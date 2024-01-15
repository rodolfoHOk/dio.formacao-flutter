import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilha_inicial_app/services/state_managers/counter_provider_service.dart';

class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build page"); // não imprime
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador Provider",
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        Consumer<CounterProviderService>(
            builder: (context, counterService, widget) {
          debugPrint("build consumer"); // imprime
          return Text(
            counterService.counter.toString(),
            style: const TextStyle(fontSize: 24),
          );
        }),
        ElevatedButton(
          onPressed: () {
            var counterService =
                Provider.of<CounterProviderService>(context, listen: false);
            counterService.increment();
          },
          child: const Text("Incrementar"),
        )
      ],
    );
  }
}
