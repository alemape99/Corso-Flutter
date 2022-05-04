import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';

class ContenutoPost extends StatefulWidget {
  const ContenutoPost({Key? key}) : super(key: key);

  @override
  _ContenutoPostState createState() => _ContenutoPostState();
}

class _ContenutoPostState extends State<ContenutoPost> {
  late List<Post> _listaPostVisualizzate;
  late bool _hasMorePost;
  late int _skipPost;
  late int _page;
  late Future<List<Post>> _future;

  @override
  void initState() {
    super.initState();
    _listaPostVisualizzate = [];
    _hasMorePost = false;
    _skipPost = 0;
    _page = 0;
    _future = _fetchPost();
  }

  Future<List<Post>> _fetchPost() async {
    final PostResponse result = await ApiPost.getPostList(page: _page);
    setState(() {
      _skipPost = _skipPost + result.limit;
      _hasMorePost = (result.total - _skipPost) > 0;
      _page++;
      _listaPostVisualizzate = _listaPostVisualizzate + result.data;
    });
    return _listaPostVisualizzate;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        setState(() {
          _listaPostVisualizzate = [];
          _hasMorePost = false;
          _skipPost = 0;
          _page = 0;
          _future = _fetchPost();
        });
        return Future.value();
      },
      child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data is List<Post>) {
              final _listPost = snapshot.data as List<Post>;
              return ListView.builder(
                  itemCount: _listPost.length + (_hasMorePost ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _listPost.length) {
                      _future = _fetchPost();
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: PostCard(_listPost[index]),
                    );
                  });
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
