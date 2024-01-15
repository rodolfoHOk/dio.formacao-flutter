import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trilha_inicial_app/services/state_managers/counter_mobx_store.dart';

// ignore: must_be_immutable
class CounterMobXStorePage extends StatelessWidget {
  CounterMobXStorePage({super.key});

  var counterMobXStore = CounterMobXStore();

  @override
  Widget build(BuildContext context) {
    debugPrint("build page"); // não imprime
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador MobX Store",
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        Observer(builder: (_) {
          return Text(
            "${counterMobXStore.counter}",
            style: const TextStyle(fontSize: 24),
          );
        }),
        ElevatedButton(
          onPressed: () {
            counterMobXStore.increment();
          },
          child: const Text("Incrementar"),
        )
      ],
    );
  }
}
