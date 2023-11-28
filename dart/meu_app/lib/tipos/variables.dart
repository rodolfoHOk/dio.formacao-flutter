void main(List<String> arguments) {
  String texto = "DIO";
  var texto2 = "DIO";
  String texto3;

  int numero1 = 1;
  var numero2 = 2;
  int numero3;

  List<String> lista = [];
  lista.add("textoA");
  // lista.add(1); // não permite
  var lista2 = [];
  lista2.add("textoA");
  lista2.add(1);
  lista2.add(1.2);

  print(texto);
  print(texto2);
  texto3 = "texto 3";
  print(texto3);

  print(numero1);
  print(numero2);
  numero3 = 3;
  print(numero3);
}
