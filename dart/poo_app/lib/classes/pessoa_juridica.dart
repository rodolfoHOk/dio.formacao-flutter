import 'package:poo_app/classes/pessoa.dart';

class PessoaJuridica extends Pessoa {
  String _cnpj = "";

  PessoaJuridica(String nome, String endereco, String cnpj)
      : super(nome, endereco) {
    _cnpj = cnpj;
  }

  void setCnpj(String cnpj) {
    _cnpj = cnpj;
  }

  String getCnpj() {
    return _cnpj;
  }

  @override
  String toString() {
    return {"Nome": getNome(), "Endereço": getEndereco(), "CNPJ": _cnpj}
        .toString();
  }
}
