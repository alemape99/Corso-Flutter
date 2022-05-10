import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/api/api_user.dart';
import 'package:social_app/components/intestazione_profilo.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';
import 'package:social_app/models/user.dart';

class ProfilePage extends StatefulWidget {
  final String id;
  const ProfilePage({required this.id, Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User user;
  late Future<User> _futureUser;
  late UniqueKey _key;

  late List<Post> _listaPostVisualizzate;
  late bool _hasMorePost;
  late int _skipPost;
  late int _page;
  late Future<List<Post>> _futurePost;

  Future<User> _fetchUser(String id) async {
    return user = await ApiUser.getDeatilsFor(id);
  }

  Future<List<Post>> _fetchPost() async {
    final PostResponse result =
        await ApiPost.getDeatilsForUser(widget.id, page: _page);
    setState(() {
      _skipPost = _skipPost + result.limit;
      _hasMorePost = (result.total - _skipPost) > 0;
      _page++;
      _listaPostVisualizzate = _listaPostVisualizzate + result.data;
    });
    return _listaPostVisualizzate;
  }


  void initVariables() {
    _listaPostVisualizzate = [];
    _hasMorePost = false;
    _skipPost = 0;
    _page = 0;
    _futurePost = _fetchPost();
  }
  @override
  void initState() {
    _futureUser = _fetchUser(widget.id);
    initVariables();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
        ),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: _futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data is User) {
                return IntestazioneProfilo(user, () async {
                  user = await ApiUser.getDeatilsFor(widget.id);
                  setState(() {
                  });
                });
              }
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  "Errore nel caricamento: ${snapshot.error}",
                  style: const TextStyle(fontSize: 24),
                ),
                );
              }
              return const Center(
                  child: CircularProgressIndicator()
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FutureBuilder(
                future: _futurePost,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data is List<Post>) {
                    final _listPost = snapshot.data as List<Post>;
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: _listPost.length + (_hasMorePost ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == _listPost.length) {
                            _futurePost = _fetchPost();
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: PostCard(_listPost[index], callback: initVariables,),
                          );
                        });
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
