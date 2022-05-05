import 'package:flutter/material.dart';
import 'package:social_app/models/post.dart';

class DetailsPost extends StatelessWidget {
  final Post post;
  const DetailsPost({required this.post,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Commenti')),
    );
  }
}
