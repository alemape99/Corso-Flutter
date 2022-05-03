import 'package:flutter/material.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/icona.png', scale: 5),
              Divider(
                thickness: 4,
                color: Colors.purple.shade400,
              ),
              Expanded(
                child: ListView(
                  children: [
                    PostCard(
                      Post(
                        id: "60d21b4667d0d8992e610c85",
                        text: "adult Labrador retriever",
                        image:
                            "https://img.dummyapi.io/photo-1564694202779-bc908c327862.jpg",
                        likes: 43,
                        link: "https://www.instagram.com/teddyosterblomphoto/",
                        tags: ["#animal", "#dog", "#golden retriever"],
                        publishDate: "2020-05-24T14:53:17.598Z",
                        owner: User(
                            id: "60d21b4667d0d8992e610c85",
                            title: "ms",
                            firstName: "Sara",
                            lastName: "Andersen",
                            picture:
                                "https://randomuser.me/api/portraits/women/58.jpg"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PostCard(
                      Post(
                        id: "60d21bf867d0d8992e610e98",
                        text: "black and white Husky",
                        image:
                            "https://img.dummyapi.io/photo-1568572933382-74d440642117.jpg",
                        likes: 79,
                        link: "https://www.instagram.com/teddyosterblomphoto/",
                        tags: ['#dog', '#animal', '#husky'],
                        publishDate: "2020-05-03T08:21:17.580Z",
                        owner: User(
                            id: "60d0fe4f5311236168a109ca",
                            title: "ms",
                            firstName: "Sara",
                            lastName: "Andersen",
                            picture:
                                "https://randomuser.me/api/portraits/women/58.jpg"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PostCard(
                      Post(
                        id: "60d21b4967d0d8992e610c90",
                        text:
                            "ice caves in the wild landscape photo of ice near ...",
                        image:
                            "https://img.dummyapi.io/photo-1510414696678-2415ad8474aa.jpg",
                        likes: 31,
                        link: "https://www.instagram.com/teddyosterblomphoto/",
                        tags: ["#snow", "#ice", "#mountain"],
                        publishDate: "2020-05-24T07:44:17.738Z",
                        owner: User(
                            id: "60d0fe4f5311236168a10a0b",
                            title: "miss",
                            firstName: "Margarita",
                            lastName: "Vicente",
                            picture:
                                "https://randomuser.me/api/portraits/med/women/5.jpg"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
