import 'package:trilha_inicial_app/models/comment_model.dart';
import 'package:trilha_inicial_app/repositories/comments/comments_repository.dart';
import 'package:trilha_inicial_app/repositories/json_placeholder_custom_dio.dart';

class CommentDioRepository implements CommentRepository {
  @override
  Future<List<CommentModel>> getComments(int postId) async {
    var jsonPlaceholderCustomDio = JsonPlaceholderCustomDio();
    var response =
        await jsonPlaceholderCustomDio.dio.get("/posts/$postId/comments");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    }
    return [];
  }
}
