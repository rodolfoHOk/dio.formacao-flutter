import 'package:poo_app/classes/pessoa_fisica.dart';
import 'package:poo_app/classes/pessoa_juridica.dart';
import 'package:poo_app/enum/tipo_notificacao.dart';
import 'package:poo_app/service/enviar_notificacao.dart';

void main(List<String> arguments) {
  var pessoaFisica1 = PessoaFisica("Rodolfo", "Rua 2, 3", "111.222.333-44");
  print(pessoaFisica1);

  var pessoaFisica2 = PessoaFisica("Mariana", "Rua 2, 3", "111.333.555-77",
      tipoNotificacao: TipoNotificacao.EMAIL);
  print(pessoaFisica2);

  var pessoaJuridica1 = PessoaJuridica(
      "HiOkTec", "Rua 3, 4", "11.222.333/4444-55",
      tipoNotificacao: TipoNotificacao.SMS);
  print(pessoaJuridica1);

  EnviarNotificacao enviarNotificacao = EnviarNotificacao();
  enviarNotificacao.notificar(pessoaFisica2);
  enviarNotificacao.notificar(pessoaJuridica1);
}
