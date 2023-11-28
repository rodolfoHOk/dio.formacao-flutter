int fatorial(int numero) {
  if (numero == 1) {
    return 1;
  }
  return numero * fatorial(numero - 1);
}

void main(List<String> args) {
  var resultado = fatorial(10);
  print(resultado);
}
