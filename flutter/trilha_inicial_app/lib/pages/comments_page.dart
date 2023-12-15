import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/comment_model.dart';
import 'package:trilha_inicial_app/repositories/http/comment_repository.dart';

import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class CommentsPage extends StatefulWidget {
  final int postId;

  const CommentsPage({super.key, required this.postId});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  var commentRepository = CommentRepository();
  var comments = <CommentModel>[];

  void loadData() async {
    comments = await commentRepository.getComments(widget.postId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "Comentários do Post ${widget.postId}"),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: comments.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (_, index) {
                    var comment = comments[index];
                    return Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  comment.name.length > 16
                                      ? comment.name.substring(0, 16)
                                      : comment.name
                                          .substring(0, comment.name.length),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  comment.email,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(comment.body),
                          ],
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
