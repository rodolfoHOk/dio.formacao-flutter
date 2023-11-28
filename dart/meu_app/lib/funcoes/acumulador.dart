import 'package:meu_app/funcoes/utils.dart' as utils;

void main(List<String> args) {
  List<double> numeros = [];
  var line = utils.lerConsole("Digite um número ou 'S' para sair");

  while (line != "S") {
    numeros.add(double.parse(line));
    line = utils.lerConsole("Digite um número ou 'S' para sair");
  }

  print(utils.somaLista(numeros));
}
