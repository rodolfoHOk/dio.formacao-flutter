import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class ConnectivityPage extends StatefulWidget {
  const ConnectivityPage({super.key});

  @override
  State<ConnectivityPage> createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      debugPrint(result.toString());
    });
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Conectividade"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: FilledButton(
                  onPressed: () async {
                    final connectivityResult =
                        await (Connectivity().checkConnectivity());
                    if (connectivityResult == ConnectivityResult.mobile) {
                      debugPrint("I am connected to a mobile network");
                    } else if (connectivityResult == ConnectivityResult.wifi) {
                      debugPrint("I am connected to a wifi network");
                    } else if (connectivityResult ==
                        ConnectivityResult.ethernet) {
                      debugPrint("I am connected to a ethernet network");
                    } else if (connectivityResult == ConnectivityResult.vpn) {
                      debugPrint("I am connected to a vpn network");
                      // Note for iOS and macOS:
                      // There is no separate network interface type for [vpn].
                      // It returns [other] on any device (also simulator)
                    } else if (connectivityResult ==
                        ConnectivityResult.bluetooth) {
                      debugPrint("I am connected to a bluetooth");
                    } else if (connectivityResult == ConnectivityResult.other) {
                      debugPrint(
                          "I am connected to a network which is not in the above mentioned networks.");
                    } else if (connectivityResult == ConnectivityResult.none) {
                      debugPrint("I am not connected to any network.");
                    }
                  },
                  child: const Text("Verificar conexão"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
