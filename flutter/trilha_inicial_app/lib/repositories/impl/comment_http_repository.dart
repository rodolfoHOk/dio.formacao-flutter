import 'dart:convert';

import 'package:trilha_inicial_app/models/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:trilha_inicial_app/repositories/comments_repository.dart';

class CommentHttpRepository implements CommentRepository {
  @override
  Future<List<CommentModel>> getComments(int postId) async {
    var uri = Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postId/comments");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var commentsJson = jsonDecode(response.body);
      return (commentsJson as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    }
    return [];
  }
}
