import 'package:trilha_inicial_app/models/comment_model.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getComments(int postId);
}
