import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trilha_inicial_app/models/post_model.dart';

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var postsJson = jsonDecode(response.body);
      return (postsJson as List)
          .map((postJson) => PostModel.fromJson(postJson))
          .toList();
    }
    return [];
  }
}
