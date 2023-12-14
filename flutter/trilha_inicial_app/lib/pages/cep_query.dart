import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/via_cep_model.dart';
import 'package:trilha_inicial_app/repositories/via_cep_repository.dart';

class CEPQueryPage extends StatefulWidget {
  const CEPQueryPage({super.key});

  @override
  State<CEPQueryPage> createState() => _CEPQueryPageState();
}

class _CEPQueryPageState extends State<CEPQueryPage> {
  var cepController = TextEditingController(text: "");

  bool loading = false;

  var viaCepRepository = ViaCEPRepository();
  var viaCepModel = ViaCEPModel();

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
                      viaCepModel = await viaCepRepository.queryCEP(cep);
                    }
                    setState(() {
                      loading = false;
                    });
                  }),
              const SizedBox(height: 24),
              Text(viaCepModel.logradouro ?? "",
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text("${viaCepModel.localidade ?? ""} - ${viaCepModel.uf ?? ""}",
                  style: const TextStyle(fontSize: 18)),
              if (loading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
