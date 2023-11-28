import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  for (var i = 0; i <= 99; i++) {
    print(i);
  }

  var texto = "Meu primeiro bloco for";
  for (var i = 0; i < texto.length; i++) {
    print(texto[i]);
  }

  for (var i = 0; i <= texto.length - 1; i++) {
    print(texto[i]);
  }

  var listaNome = ["Danilo", "Rodolfo", "Mariana"];
  for (var i = 0; i < listaNome.length; i++) {
    print(listaNome[i]);
  }

  var result = 0;
  for (var i = 1; i <= 100; i++) {
    result = result + i;
    print("$i - $result");
  }

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
