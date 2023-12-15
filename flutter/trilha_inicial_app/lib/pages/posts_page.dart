import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/post_model.dart';
import 'package:trilha_inicial_app/pages/comments_page.dart';
import 'package:trilha_inicial_app/repositories/http/post_repository.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  var postRepository = PostRepository();
  var posts = <PostModel>[];

  void loadData() async {
    posts = await postRepository.getPosts();
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
        appBar: const CustomAppBar(title: "Posts"),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext _, int index) {
              var post = posts[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext _) =>
                          CommentsPage(postId: post.id),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                  child: Card(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            post.body,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
