void main(List<String> arguments) {
  var prova1 = 8; // 8 , 6

  // sem if ternário
  var resultado = "";
  if (prova1 >= 7) {
    resultado = "O aluno passou";
  } else {
    resultado = "O aluno reprovou";
  }
  print(resultado);

  // com if ternário
  var resultado2 = prova1 >= 7 ? "O aluno passou" : "O aluno reprovou";
  print(resultado2);
}
