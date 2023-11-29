import 'package:poo_app/classes/pessoa.dart';
import 'package:poo_app/enum/tipo_notificacao.dart';

class PessoaFisica extends Pessoa {
  String _cpf = "";

  PessoaFisica(String nome, String endereco, String cpf,
      {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, tipoNotificacao: tipoNotificacao) {
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
    return {
      "Nome": getNome(),
      "Endereço": getEndereco(),
      "TipoNotificacao": getTipoNotificacao(),
      "CPF": _cpf
    }.toString();
  }
}
