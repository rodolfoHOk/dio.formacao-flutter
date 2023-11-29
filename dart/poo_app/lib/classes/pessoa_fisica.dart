import 'package:poo_app/classes/pessoa.dart';

class PessoaFisica extends Pessoa {
  String _cpf = "";

  PessoaFisica(String nome, String endereco, String cpf)
      : super(nome, endereco) {
    _cpf = cpf;
  }

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  String getCpf() {
    return _cpf;
  }

  @override
  String toString() {
    return {"Nome": getNome(), "Endereço": getEndereco(), "CPF": _cpf}
        .toString();
  }
}
