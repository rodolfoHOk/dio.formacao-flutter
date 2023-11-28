void main(List<String> arguments) {
  dynamic var1 = "ABC";
  print(var1);

  var1 = 10;
  print(var1);

  var1 = 99.54;
  print(var1);

  var1 = true;
  print(var1);

  var1 = DateTime(2023, 11, 28);
  print(var1);

  var1 = [10, true, "A"];
  print(var1);

  var var2 = "ABC";
  print(var2.length); // tem auto complete de string

  var1 = "ABC";
  print(var1.length); // aceita mas não tem auto complete
  // print(var1.algoquenaoexiste); // aceita mas dá erro no build
}
