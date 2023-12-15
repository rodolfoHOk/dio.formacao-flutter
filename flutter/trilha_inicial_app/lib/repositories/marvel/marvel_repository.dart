import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trilha_inicial_app/models/characters_model.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MarvelRepository {
  Future<CharactersModel> getCharacters() async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = dotenv.get("DEV_MARVEL_PUBLIC_KEY");
    var privateKey = dotenv.get("DEV_MARVEL_PRIVATE_KEY");
    var hash = generateMd5("$ts$privateKey$publicKey");
    var query = "?ts=$ts&apikey=$publicKey&hash=$hash";
    var result = await dio
        .get("https://gateway.marvel.com:443/v1/public/characters$query");
    return CharactersModel.fromJson(result.data);
  }

  String generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
