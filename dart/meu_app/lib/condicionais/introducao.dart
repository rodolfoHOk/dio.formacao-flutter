void main(List<String> arguments) {
  var prova1 = 9;
  var prova2 = 5;
  var media = (prova1 + prova2) / 2;

  print(media);
  print(media >= 7);
  print(media < 7);
  print(prova1 == prova2);
  print(prova1 != prova2);
  print(prova1 >= 7 && prova2 >= 7);

  prova1 = 10;
  print(prova1 == 10 || prova2 == 10);

  prova1 = 9;
  prova2 = 9;
  print(prova1 == prova2);
}
