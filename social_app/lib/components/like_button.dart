import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';

class LikeButton extends StatefulWidget {
  final Post post;
  final String? userIdLoggato;
  const LikeButton(this.post, this.userIdLoggato, {Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _conLike = false;
  late int _numLikes;


  initLike() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var listaLike = sp.getStringList('like_${widget.userIdLoggato}') ?? [];
    setState(() {
      _conLike = listaLike.contains(widget.post.id);
    });
  }

  void addAndRemovePreferiti() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var listaLike = sp.getStringList('like_${widget.userIdLoggato}') ?? [];

    _conLike
        ? listaLike.remove(widget.post.id!)
        : listaLike.add(widget.post.id!);

    await sp.setStringList('like_${widget.userIdLoggato}', listaLike);

    _conLike
    ? _numLikes--
    : _numLikes++;

    await ApiPost.modifyPost(
        Post(
            id: widget.post.id,
            likes: _numLikes,
            owner: User(
                firstName: 'Alessandro' ,
                lastName: 'Mapelli'),
        ), widget.userIdLoggato!
    );

    setState(() {
      _conLike = !_conLike;
    });
  }



  @override
  void initState() {
    _numLikes = widget.post.likes ?? 0;
    initLike();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: addAndRemovePreferiti,
        icon: Icon(_conLike ? Icons.thumb_up : Icons.thumb_up_alt_outlined),
        label: Text(_numLikes.toString())
    );
  }
}
