void main(List<String> arguments) {
  List<String> stringList = [];
  var intList = [1, 10, 50];
  List dynamicList = [];

  print("Tamanho da lista");
  print(stringList.length);
  print(intList.length);
  print(dynamicList.length);

  print(stringList);
  print(intList);
  print(dynamicList);

  print("Adicionar item");
  stringList.add("M");
  stringList.add("B");
  // stringList.add(10); // não permite
  intList.add(90);
  // intList.add("A"); // não permite;
  dynamicList.add("A");
  dynamicList.add(10);
  dynamicList.add(9.5);
  dynamicList.add(true);
  print(stringList);
  print(intList);
  print(dynamicList);

  stringList.remove("M");
  intList.remove(90);
  dynamicList.remove(9.5);
  print(stringList);
  print(intList);
  print(dynamicList);

  print("Verifica se a lista está vazia ou não vazia");
  print(stringList.isEmpty);
  print(stringList.isNotEmpty);

  print("Verifica se a lista contém um valor");
  print(stringList.contains("B"));
  print(dynamicList.contains(true));
  print(stringList.contains("C"));
  print(dynamicList.contains(false));

  print("where function");
  print(intList);
  print(intList.where((x) => x > 9 && x < 99));

  // Outras funções
  print(intList.reversed);
  print(intList.first);
  // print(intList.); // veja o que aparece quando põe o ponto
}
