import 'package:flutter/material.dart';
import 'package:social_app/components/bottone_add_commenti.dart';
import 'package:social_app/components/commenti_post.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';

class DetailsPost extends StatefulWidget {
  final Post post;

  const DetailsPost({required this.post,Key? key}) : super(key: key);

  @override
  State<DetailsPost> createState() => _DetailsPostState();
}

class _DetailsPostState extends State<DetailsPost> {
  late UniqueKey _key;

  void refreshKey(){
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  void initState() {
    _key = UniqueKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text(
            'Comments'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            PostCard(widget.post, showCommentButton: false),
            if (widget.post.id  != null)
              CommentiPost(id:widget.post.id!)
          ],
        ),
      ),
      floatingActionButton: BottoneAddCommenti(widget.post,refreshKey),
    );
  }
}
