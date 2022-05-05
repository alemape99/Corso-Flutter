import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_app/models/comment.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;
  const CommentWidget(this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.purple)
          ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${comment.owner.firstName} ${comment.owner.lastName}: ', style: const TextStyle(fontWeight: FontWeight.bold),),
                    if (comment.publishDate != null)
                    Text('(${DateFormat("d/M/y HH:mm")
                        .format(DateTime.parse(comment.publishDate))})', style: const TextStyle(fontSize: 12),
                      ),
                  ],
                ),
                Text(comment.message, style: const TextStyle(fontSize: 15),),
              ],
          ),
        ),
      ),
    );
  }
}
