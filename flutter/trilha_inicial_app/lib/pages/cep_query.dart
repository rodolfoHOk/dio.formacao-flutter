import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trilha_inicial_app/models/via_cep_model.dart';

class CEPQueryPage extends StatefulWidget {
  const CEPQueryPage({super.key});

  @override
  State<CEPQueryPage> createState() => _CEPQueryPageState();
}

class _CEPQueryPageState extends State<CEPQueryPage> {
  var cepController = TextEditingController(text: "");
  String street = "";
  String city = "";
  String state = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              const Text("Consultar CEP",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                  controller: cepController,
                  keyboardType: TextInputType.number,
                  // maxLength: 8,
                  onChanged: (String value) async {
                    var cep = value.replaceAll(RegExp(r'[^0-9]'), "");
                    if (cep.length == 8) {
                      setState(() {
                        loading = true;
                      });
                      var response = await http.get(
                          Uri.parse("https://viacep.com.br/ws/$cep/json/"));
                      // debugPrint(response.statusCode.toString());
                      // debugPrint(response.body);
                      // Map<String, dynamic> json = jsonDecode(response.body);
                      var viaCepModel =
                          ViaCEPModel.fromJson(jsonDecode(response.body));
                      // debugPrint(json.toString());
                      // debugPrint(json["logradouro"]);
                      // street = json["logradouro"];
                      // city = json["localidade"];
                      // state = json["uf"];
                      street = viaCepModel.logradouro ?? "";
                      city = viaCepModel.localidade ?? "";
                      state = viaCepModel.uf ?? "";
                    } else {
                      street = "";
                      city = "";
                      state = "";
                    }
                    setState(() {
                      loading = false;
                    });
                  }),
              const SizedBox(height: 24),
              Text(street, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text("$city - $state", style: const TextStyle(fontSize: 18)),
              if (loading) const CircularProgressIndicator(),
              // Visibility(
              //     visible: loading, child: const CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
