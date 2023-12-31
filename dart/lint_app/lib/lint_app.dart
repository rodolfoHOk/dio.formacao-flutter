import 'dart:io';

import 'package:lint_app/exception/nome_invalido_exception.dart';
import 'package:lint_app/models/aluno.dart';
import 'package:lint_app/utils/console_utils.dart';

void execute() {
  print("Bem vindo ao sistema de notas!");
  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do aluno");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    // nome = "Nome Padrão";
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }
  var aluno = Aluno(nome);

  double? nota;
  do {
    nota = ConsoleUtils.lerDoubleComTextoComSaida(
        "Digite a nota do aluno ou S para sair", "S");
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);

  print("As notas digitadas foram: ${aluno.getNotas()}");
  print("A média do aluno foi: ${aluno.retornaMedia()}");

  if (aluno.aprovado(7)) {
    print("O aluno ${aluno.getNome()} foi aprovado");
  } else {
    print("O aluno ${aluno.getNome()} foi reprovado");
  }
}
