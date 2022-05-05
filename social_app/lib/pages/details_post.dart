import 'package:flutter/material.dart';
import 'package:social_app/components/commenti_post.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';

class DetailsPost extends StatelessWidget {
  final Post post;
  const DetailsPost({required this.post,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            PostCard(post, showCommentButton: false,),
            if (post.id  != null)
              CommentiPost(id:post.id!)
          ],
        ),
      ),
    );
  }
}
