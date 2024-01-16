import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilha_inicial_app/services/state_managers/counter_getx_controller.dart';

// ignore: must_be_immutable
class CounterGetXPage extends StatelessWidget {
  CounterGetXPage({super.key});

  var counterGetController = CounterGetController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador GetX",
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        Obx(() {
          return Text(
            "${counterGetController.count}",
            style: const TextStyle(fontSize: 24),
          );
        }),
        ElevatedButton(
          onPressed: () {
            counterGetController.increment();
          },
          child: const Text("Incrementar"),
        )
      ],
    );
  }
}
