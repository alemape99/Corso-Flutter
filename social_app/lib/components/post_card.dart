import 'package:flutter/material.dart';
import 'package:social_app/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple.shade400),
          borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    post.image,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${post.owner.firstName} ${post.owner.lastName}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(post.publishDate),
                        const Icon(
                          Icons.public,
                          size: 15,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(post.text),
            const SizedBox(height: 5,),
            Image.network(
              post.image,
              width: MediaQuery.of(context).size.width - 30,
            ),
            const SizedBox(height: 5,),
            Chip(
                label:Text((post.tags).toString(),
                ),
            ),
            Divider(
              thickness: 2,
              color: Colors.purple.shade400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => print('Likes'),
                  child: Row(
                    children: [
                      const Icon(Icons.thumb_up),
                      const SizedBox(width: 4,),
                      Text('Likes: ${(post.likes).toString()}')
                    ],
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () => print('Comment'),
                  child: Row(
                    children: const [
                      Icon(Icons.mode_comment_outlined),
                      SizedBox(width: 4,),
                      Text('Comment'),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () => print('Share'),
                  child: Row(
                    children: const [
                      Icon(Icons.share_outlined),
                      SizedBox(width: 4,),
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
    );
  }
}
