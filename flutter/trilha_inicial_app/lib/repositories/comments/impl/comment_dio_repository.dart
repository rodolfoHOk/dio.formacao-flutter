import 'package:dio/dio.dart';
import 'package:trilha_inicial_app/models/comment_model.dart';
import 'package:trilha_inicial_app/repositories/comments/comments_repository.dart';

class CommentDioRepository implements CommentRepository {
  @override
  Future<List<CommentModel>> getComments(int postId) async {
    var dio = Dio();
    var response = await dio
        .get("https://jsonplaceholder.typicode.com/posts/$postId/comments");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    }
    return [];
  }
}
