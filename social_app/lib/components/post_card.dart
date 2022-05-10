import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/components/bottone_aggiungi_modifica_post.dart';
import 'package:social_app/components/like_button.dart';
import 'package:social_app/models/post.dart';
import 'package:intl/intl.dart';
import 'package:social_app/pages/details_post.dart';
import 'package:social_app/pages/profile_page.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final bool showCommentButton;
  final VoidCallback callback;

  const PostCard(this.post,
      {this.showCommentButton = true, required this.callback, Key? key})
      : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  String? _userId;


  Future<void> _initIdUtente() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      _userId = sp.getString('loggedUserId');
    });
  }


  @override
  void initState() {

    _initIdUtente();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.purple),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        ProfilePage(
                          id: widget.post.owner!.id!,))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(widget.post.owner!.picture!,),
                        ),
                        const SizedBox(width: 16),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text('${widget.post.owner!.firstName} ${widget.post.owner!.lastName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                              Row(
                                children: [
                                  if (widget.post.publishDate != null)
                                    Text(
                                      DateFormat("d/M/y HH:mm").format(
                                          DateTime.parse(widget.post.publishDate!)),
                                    ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.public, color: Colors.purple, size: 15,)
                                ],
                              )
                        ]),
                      ],
                    ),
                    TextButton(
                        child: const Text('Modifica'),
                        onPressed: () async {
                          var change = await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) =>
                                  BottoneAggiungiModificaPost(_userId!, post: widget.post)
                          );
                          if (change == true) {
                            widget.callback();
                          }
                        }),
                    IconButton(
                        icon: const Icon(Icons.delete, color: Colors.purple,),
                        onPressed: () async {
                          if(widget.post.id != null){
                            await ApiPost.deletePost(widget.post.id!);
                          }
                            setState(() {
                              widget.callback();
                            });
                        }),
                  ],
                ),
              ),
              if (widget.post.text != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(widget.post.text ?? ''),
                ),
              const SizedBox(
                height: 5,
              ),
              if (widget.post.image != null && widget.post.image!.isNotEmpty)
                Image.network(
                  widget.post.image!,
                ),
              const SizedBox(
                height: 5,
              ),
              if (widget.post.tags != null)
                Wrap(
                  spacing: 6,
                  children: widget.post.tags!
                      .map((tag) => Chip(label: Text(tag)))
                      .toList(),
                ),
              const Divider(
                thickness: 2,
                color: Colors.purple,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(_userId != null) LikeButton(widget.post, _userId),
                  if (widget.showCommentButton == true)
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPost(
                                  post: widget.post,
                                )),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.mode_comment_outlined,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text('Comment'),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.share_outlined,
                          color: Colors.purple,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Share'),
                      ],
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
