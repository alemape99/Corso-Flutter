import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/models/post.dart';

class BottoneAddPost extends StatefulWidget {
  final Function? callback;
  const BottoneAddPost(this.callback,{Key? key}) : super(key: key);

  @override
  State<BottoneAddPost> createState() => _BottoneAddPostState();
}

class _BottoneAddPostState extends State<BottoneAddPost> {
  late Post _post;
  late TextEditingController _textController;
  late TextEditingController _tagController;
  late String? _text;
  late String _tag;

  @override
  void initState(){
    _textController = TextEditingController();
    _tagController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      onPressed: () async {
        var create = await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context){
              return Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 8,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    TextField(
                      controller: _textController,
                      onChanged: (value){
                        _text = _textController.text;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Scrivi il testo del tuo post',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Container(
                        height: 200,
                          child: Image.network(
                              'https://www.legadelcane.org/wp-content/uploads/puppy-1903313_1920-1080x675.jpg'
                          ),
                      ),
                    ),
                   TextField(
                      controller: _tagController,
                      onChanged: (value){
                        _tag = _tagController.text;
                      },
                      decoration:  const InputDecoration(
                        hintText: 'Scrivi qui i tuoi hastags',
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: const Text('Annulla'),
                          onPressed: () {
                            _textController.clear();
                            _tagController.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                            child: const Text(
                                'Pubblica'
                            ),
                            onPressed: () async{
                              _post = Post(
                                  image: 'https://www.legadelcane.org/wp-content/uploads/puppy-1903313_1920-1080x675.jpg',
                                  text: _text ?? '',
                                  tags: _tag.split(', ')
                              );
                              await ApiPost.addPost(_post);
                              _textController.clear();
                              _tagController.clear();
                              Navigator.of(context).pop(true);
                            },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            });
        if (create == true) {
          widget.callback!();
        }
      },
      child: const Icon(Icons.add),
      elevation: 2.0,
    );
  }
}
