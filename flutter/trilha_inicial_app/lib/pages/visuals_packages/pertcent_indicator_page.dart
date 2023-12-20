import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class PercentIndicatorPage extends StatefulWidget {
  const PercentIndicatorPage({super.key});

  @override
  State<PercentIndicatorPage> createState() => _PercentIndicatorPageState();
}

class _PercentIndicatorPageState extends State<PercentIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Indicador de porcentagem'),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              CircularPercentIndicator(
                radius: 48.0,
                lineWidth: 4.0,
                percent: 0.7,
                center: const Text("70%"),
                progressColor: Colors.green,
              ),
              const SizedBox(height: 16),
              CircularPercentIndicator(
                radius: 72.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 8.0,
                percent: 0.4,
                center: const Text(
                  "40 hours",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.yellow,
                progressColor: Colors.red,
              ),
              const SizedBox(height: 16),
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.9,
                center: const Text("90.0%"),
                barRadius: const Radius.circular(10),
                progressColor: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
