import 'package:trilha_inicial_app/models/post_model.dart';
import 'package:trilha_inicial_app/repositories/posts/post_repository.dart';
import 'package:dio/dio.dart';

class PostDioRepository implements PostRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var dio = Dio();
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    }
    return [];
  }
}
