import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trilha_inicial_app/services/state_managers/counter_mobx_service.dart';

// ignore: must_be_immutable
class CounterMobXPage extends StatelessWidget {
  CounterMobXPage({super.key});

  var counterMobXService = CounterMobXService();

  @override
  Widget build(BuildContext context) {
    debugPrint("build page"); // não imprime
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador MobX",
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        Observer(builder: (_) {
          return Text(
            "${counterMobXService.counter}",
            style: const TextStyle(fontSize: 24),
          );
        }),
        ElevatedButton(
          onPressed: () {
            counterMobXService.increment();
          },
          child: const Text("Incrementar"),
        )
      ],
    );
  }
}
