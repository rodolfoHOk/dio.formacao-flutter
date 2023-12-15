import 'dart:convert';

import 'package:trilha_inicial_app/models/via_cep_model.dart';
import 'package:http/http.dart' as http;

class ViaCEPRepository {
  Future<ViaCEPModel> queryCEP(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    if (response.statusCode == 200) {
      return ViaCEPModel.fromJson(jsonDecode(response.body));
    }
    return ViaCEPModel();
  }
}
