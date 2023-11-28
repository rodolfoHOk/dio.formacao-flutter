void main(List<String> arguments) {
  printHelloWorld();

  printName("Rodolfo");

  var number = returnNumber();
  print(number);

  var resultado = sum(20, 30);
  print(resultado);
  resultado = sum(20, 40);
  print(resultado);
  resultado = sum(20, 50);
  print(resultado);
}

void printHelloWorld() {
  print("Hello World!");
}

void printName(String name) {
  print("My name is: $name");
}

int returnNumber() {
  return 30;
}

int sum(int number1, int number2) {
  return (number1 + number2);
}
