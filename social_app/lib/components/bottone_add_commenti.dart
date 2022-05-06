import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/api/api_comment.dart';
import 'package:social_app/models/post.dart';

class BottoneAddCommenti extends StatefulWidget {
  final Post post;
  const BottoneAddCommenti(this.post, {Key? key}) : super(key: key);

  @override
  State<BottoneAddCommenti> createState() => _BottoneAddCommentiState();
}

class _BottoneAddCommentiState extends State<BottoneAddCommenti> {
  late TextEditingController _textEditingController;
  String? _message;
  late String? _idUser;
  late String? _idPost;



  Future<void> _initIdUtente ()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    _idUser = sp.getString('loggedUserId');
    if (_idUser == null) {
      throw Exception('Utente non loggato');
    }
  }


  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _initIdUtente();
    _idPost = widget.post.id;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 8,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Inserisci il tuo commento'),
                    TextField(
                      controller: _textEditingController,
                      maxLines: 5,
                      onChanged: (value) {
                        _message = _textEditingController.text;
                      },
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: const Text('Annulla'),
                          onPressed: () {
                            _message = null;
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Pubblica'),
                          onPressed: () async {
                            if (_message == null || _message!.isEmpty) {
                              Navigator.of(context).pop(); //oppure Alert Dialog
                            }
                            final response = await ApiComment.addCommentTo(_idPost!, _message!);
                            print(response.id);
                            Navigator.of(context).pop();
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
