import 'dart:convert';
import 'dart:io';

import 'package:meu_app/meu_app.dart' as meu_app;

void main(List<String> arguments) {
  print('Hello world - ${meu_app.calculate()}!');

  var resultado = 0;
  var quantidade = 0;

  print("Informe a quantidade de números:");
  var line = stdin.readLineSync(encoding: utf8);
  quantidade = int.parse(line ?? "0");

  for (var i = 0; i < quantidade; i++) {
    print("Informe o número:");
    line = stdin.readLineSync(encoding: utf8);
    var numero = int.parse(line ?? "0");

    resultado = resultado + numero;
    print("$i - $resultado");
  }
}
