import 'dart:convert';
import 'dart:io';

import 'package:meu_app/meu_app.dart' as meu_app;

void main(List<String> arguments) {
  print('Hello world - ${meu_app.calculate()}!');

  print("Digite um número ou 'S' para sair");
  var line = stdin.readLineSync(encoding: utf8);

  double acumulador = 0;

  while (line != "S") {
    var numero = double.parse(line ?? "");
    acumulador = acumulador + numero;
    print("Digite um número ou 'S' para sair");
    line = stdin.readLineSync(encoding: utf8);
  }

  print(acumulador);
}
