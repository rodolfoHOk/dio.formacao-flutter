import 'package:poo_app/classes/pessoa.dart';
import 'package:poo_app/enum/tipo_notificacao.dart';
import 'package:poo_app/service/impl/notificacao_email.dart';
import 'package:poo_app/service/impl/notificacao_push_notification.dart';
import 'package:poo_app/service/impl/notificacao_sms.dart';
import 'package:poo_app/service/notificacao_interface.dart';

class EnviarNotificacao {
  NotificacaoInterface? notificacao;

  void notificar(Pessoa pessoa) {
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.EMAIL:
        notificacao = NotificacaoEmail();
        break;
      case TipoNotificacao.PUSH_NOTIFICATION:
        notificacao = NotificacaoPushNotification();
        break;
      case TipoNotificacao.SMS:
        notificacao = NotificacaoSMS();
        break;
      default:
        break;
    }

    if (notificacao != null) {
      notificacao!.enviarNotificacao(pessoa);
    } else {
      print("Pessoa sem tipo de notificação");
    }
  }
}
