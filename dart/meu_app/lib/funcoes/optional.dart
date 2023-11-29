void main(List<String> args) {
  printName("João");

  printName("Rodolfo", sobrenome: "HiOk");
}

// void printName(String name, {String sobrenome = ""}) {
//   print("My name is: $name");
//   if (sobrenome != "") {
//     print("My lastname is: $sobrenome");
//   }
// }

void printName(String name, {String? sobrenome}) {
  print("My name is: $name");
  if (sobrenome != null) {
    print("My lastname is: $sobrenome");
  }
}
