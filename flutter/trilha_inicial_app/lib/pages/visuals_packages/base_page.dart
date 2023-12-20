import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Base page'),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Column(
            children: [
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
