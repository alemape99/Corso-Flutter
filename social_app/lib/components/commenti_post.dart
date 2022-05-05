import 'package:flutter/material.dart';
import 'package:social_app/api/api_comment.dart';
import 'package:social_app/components/comment_widget.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/comment.dart';
import 'package:social_app/models/comment_response.dart';
import 'package:social_app/models/user.dart';

class CommentiPost extends StatefulWidget {
  final String id;
  const CommentiPost({required this.id, Key? key}) : super(key: key);

  @override
  State<CommentiPost> createState() => _CommentiPostState();
}

class _CommentiPostState extends State<CommentiPost> {

  late List<Comment> _listaComment;
  late bool _hasMoreComment;
  late int _skipComment;
  late int _page;
  late Future<List<Comment>> _future;

  @override
  void initState() {
    _listaComment = [];
    _hasMoreComment = false;
    _skipComment = 0;
    _page = 0;
    _future = _fetchComment();
    super.initState();
  }



  Future<List<Comment>> _fetchComment() async {
    final CommentResponse result = await ApiComment.getCommentsFromPost(widget.id);
    setState(() {
      _skipComment = _skipComment + result.limit;
      _hasMoreComment = (result.total - _skipComment) > 0;
      _page++;
      _listaComment = _listaComment + result.data;
    });
    return _listaComment;
}



  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot<List<Comment>> snapshot) {
          if (snapshot.hasData) {
            List<Comment> comments = snapshot.data ?? [];
            if (comments.isEmpty) {
              return const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.center
                    ,child: Text('Non ci sono Commenti', style: TextStyle(fontSize: 16),)),
              );
            }
            else {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      if (index == _listaComment.length) {
                        _future = _fetchComment();
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CommentWidget(_listaComment[index]);
                    });
              }
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                    "Errore nel caricamento: ${snapshot.error}",
                    style: const TextStyle(fontSize: 24),
                  ));
            }
            return const Center(child: CircularProgressIndicator());
          }
        ),
    );
  }
}
