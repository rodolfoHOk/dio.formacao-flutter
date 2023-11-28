void main(List<String> arguments) {
  double numero1 = 10.9;
  var numero2 = 11.1;

  print("Remove ponto flutuante");
  print(numero1.truncate()); // ignora após o ponto

  print("Converte para inteiro");
  print(numero1.toInt()); // equivalente ao truncate

  print("Arredondamento para cima");
  print(numero1.ceil());
  print(numero2.ceil());

  print("Arredondamento para baixo");
  print(numero1.floor());
  print(numero2.floor());

  print("Verifica se o número é finito");
  print(numero1.isFinite);
  print(numero2.isFinite);

  print("Verifica se o número é infinito");
  print(numero1.isInfinite);
  print(numero2.isInfinite);

  print("Verifica se o número não é válido");
  print(numero1.isNaN);
  print(numero2.isNaN);

  print("Verifica se o número é negativo");
  print(numero1.isNegative);
  print((numero2 * -1).isNegative);

  print("Converte String para double");
  print(double.parse("10"));
  // print(double.parse("teste")); // erro
  print(double.tryParse("teste")); // returna null
}
