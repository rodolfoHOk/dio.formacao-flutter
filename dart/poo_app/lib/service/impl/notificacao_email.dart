import 'package:poo_app/classes/pessoa.dart';
import 'package:poo_app/service/notificacao_interface.dart';

class NotificacaoEmail implements NotificacaoInterface {
  @override
  void enviarNotificacao(Pessoa pessoa) {
    print("Enviando Email para: ${pessoa.getNome()}");
  }
}
