import 'package:trilha_inicial_app/models/comment_model.dart';
import 'package:trilha_inicial_app/repositories/comments_repository.dart';
import 'package:trilha_inicial_app/repositories/json_placeholder_custom_dio.dart';

class CommentDioRepository implements CommentRepository {
  final JsonPlaceholderCustomDio jsonPlaceholderCustomDio;

  CommentDioRepository(this.jsonPlaceholderCustomDio);

  @override
  Future<List<CommentModel>> getComments(int postId) async {
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
