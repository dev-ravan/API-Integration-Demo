import 'package:demo/Data/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    final provider = Provider.of<PostsProvider>(context, listen: false);
    provider.listOfPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Integration"),
      ),
      body: Consumer<PostsProvider>(builder: (context, post, child) {
        return ListView.builder(
            itemCount: post.postsList.length,
            itemBuilder: (context, index) {
              final data = post.postsList[index];
              return ListTile(
                title: Text(data["title"]),
                subtitle: Text(data["body"]),
              );
            });
      }),
    );
  }
}
