import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  var battery = Battery();

  var batteryLevel = 0;

  var batteryStatus = "";

  void initPage() async {
    batteryLevel = await battery.batteryLevel;
    batteryStatus = (await battery.batteryState).toString();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initPage();
    battery.onBatteryStateChanged.listen((BatteryState state) {
      batteryStatus = state.toString();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "Status de Bateria: $batteryLevel%"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Text("Status da bateria: $batteryStatus"),
              const SizedBox(height: 16),
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: batteryLevel / 100,
                center: Text(batteryLevel.toString()),
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
