import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_app/api/api_comment.dart';
import 'package:social_app/models/comment.dart';

class CommentWidget extends StatefulWidget {
  final Comment comment;
  const CommentWidget(this.comment, {Key? key}) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  late bool _deleted;

  @override
  void initState() {
    _deleted = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_deleted,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.purple)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                            widget.comment.owner.picture!,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.comment.owner.firstName} ${widget.comment.owner.lastName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  if (widget.comment.publishDate != null)
                                    Text(
                                      '(${DateFormat("d/M/y HH:mm").format(DateTime.parse(widget.comment.publishDate!))})',
                                      style: const TextStyle
                                        (fontSize: 12
                                      ),
                                    ),
                                ],
                              ),
                            ]),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        late bool result;
                        if (widget.comment.id != null) {
                          result = await ApiComment.deleteCommentId(
                              widget.comment.id!);
                        }
                        if (result == true) {
                          setState(() {
                            _deleted = true;
                          });
                        }
                      },
                    ),
                  ],
                ),
                /*Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          widget.comment.owner.picture!
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${widget.comment.owner.firstName} ${widget.comment.owner.lastName}: ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (widget.comment.publishDate != null)
                      Text(
                        '(${DateFormat("d/M/y HH:mm").format(DateTime.parse(widget.comment.publishDate!))})',
                        style: const TextStyle
                          (fontSize: 12
                        ),
                      ),
                    IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed:() async {
                          late bool result;
                          if(widget.comment.id != null){
                            result = await ApiComment.deleteCommentId(widget.comment.id!);
                          }
                          if(result == true){
                            setState(() {
                              _deleted = true;
                            });
                          }
                        }, ),
                  ],
                ),*/
                Text(
                  widget.comment.message,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
