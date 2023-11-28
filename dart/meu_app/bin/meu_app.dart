import 'dart:convert';
import 'dart:io';

import 'package:meu_app/meu_app.dart' as meu_app;

void main(List<String> arguments) {
  print('Hello world - ${meu_app.calculate()}!');

  var opcao = "";
  var acumulador = 0.0;

  do {
    print("Digite um número ou 'S' para sair");
    var line = stdin.readLineSync(encoding: utf8);

    opcao = line ?? "";
    var numero = double.tryParse(opcao);
    if (numero != null) {
      acumulador = acumulador + numero;
    }
  } while (opcao != "S");

  print(acumulador);
}
