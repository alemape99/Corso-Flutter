import 'package:flutter/material.dart';
import 'package:social_app/api/api_post.dart';
import 'package:social_app/components/contenuto_post.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/post_response.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



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
              Expanded(child: const ContenutoPost()),
            ],
          ),
        ),
      ),
    );
  }
}
