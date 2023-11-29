import 'package:poo_app/classes/pessoa.dart';
import 'package:poo_app/enum/tipo_notificacao.dart';

class PessoaJuridica extends Pessoa {
  String _cnpj = "";

  PessoaJuridica(String nome, String endereco, String cnpj,
      {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, tipoNotificacao: tipoNotificacao) {
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
    return {
      "Nome": getNome(),
      "Endereço": getEndereco(),
      "TipoNotificacao": getTipoNotificacao(),
      "CNPJ": _cnpj
    }.toString();
  }
}
