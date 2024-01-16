import 'package:trilha_inicial_app/models/post_model.dart';
import 'package:trilha_inicial_app/repositories/json_placeholder_custom_dio.dart';
import 'package:trilha_inicial_app/repositories/posts/post_repository.dart';

class PostDioRepository implements PostRepository {
  final JsonPlaceholderCustomDio jsonPlaceholderCustomDio;

  PostDioRepository(this.jsonPlaceholderCustomDio);

  @override
  Future<List<PostModel>> getPosts() async {
    var response = await jsonPlaceholderCustomDio.dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    }
    return [];
  }
}
