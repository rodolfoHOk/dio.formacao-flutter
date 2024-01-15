import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  var cepController = TextEditingController(text: "");
  var cpfController = TextEditingController(text: "");
  var centavosController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Máscaras Brasil"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: cepController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: "CEP",
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cpfController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: "CPF",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: centavosController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter(moeda: true),
                ],
                decoration: const InputDecoration(
                  labelText: "Centavos",
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  onPressed: () {
                    if (!CPFValidator.isValid(cpfController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "CPF Inválido - Um válido é: ${CPFValidator.generate().toString()}"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: const Text("Continuar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
