import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';

class BottoneAggiungiModificaPost extends StatefulWidget {
  final Post? post;
  final String userId;
  const BottoneAggiungiModificaPost(this.userId, {this.post, Key? key})
      : super(key: key);

  @override
  State<BottoneAggiungiModificaPost> createState() => _BottoneAggiungiModificaPostState();
}

class _BottoneAggiungiModificaPostState extends State<BottoneAggiungiModificaPost> {


  late TextEditingController _controllerText;
  late TextEditingController _controllerTags;

  @override
  void initState() {
    if (widget.post != null) {
      _controllerText = TextEditingController(text: widget.post!.text);
      final String tags = widget.post!.tags?.join(', ') ?? '';
      _controllerTags = TextEditingController(text: tags);
    }
    else {
      _controllerText = TextEditingController();
      _controllerTags = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
        left: 8,
        right: 8,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          (widget.post != null) ?
          TextField(controller: _controllerText,) :
          TextField(
            controller: _controllerText,
            decoration: const InputDecoration(
              hintText: 'Scrivi il testo del tuo post',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              height: 200,
              child: Image.network(
                  'https://www.legadelcane.org/wp-content/uploads/puppy-1903313_1920-1080x675.jpg'
              ),
            ),
          ),
          (widget.post != null) ? TextField(
            controller: _controllerTags,
          ) : TextField(
            controller: _controllerTags,
            decoration:  const InputDecoration(
              hintText: 'Scrivi qui i tuoi hastags',
            ),
          ),
          Row(
            children: [
              TextButton(
                  child: const Text('Annulla'),
                  onPressed: () {
                    if (widget.post != null) {
                      _controllerText.text = widget.post!.text ?? '';
                      final String tags = widget.post!.tags?.join(', ') ?? '';
                      _controllerTags.text = tags;
                    }
                    Navigator.of(context).pop();
                  }),
              TextButton(
                onPressed: () async {
                  if(widget.post == null){
                    final _newPost = Post(
                      image: 'https://www.legadelcane.org/wp-content/uploads/puppy-1903313_1920-1080x675.jpg',
                      text: _controllerText.text,
                      tags: _controllerTags.text.split(', '),
                    );

                    await ApiPost.addPost(_newPost, widget.userId);

                  Navigator.of(context).pop(true);
                  } else {
                    final _modPost = Post(
                        id: widget.post?.id,
                        text: _controllerText.text,
                        tags: _controllerTags.text.split(', '),
                        owner: User(
                            firstName:' Alessandro',
                            lastName: 'Mapelli'
                        )
                    );

                     await ApiPost.modifyPost(_modPost, widget.userId);
                      Navigator.of(context).pop(true);

                  }
                },
                child: widget.post != null ? const Text('Aggiorna') : const Text('Pubblica')
              )
            ],
          ),
        ],
      ),
    );
  }
}
