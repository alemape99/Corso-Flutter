import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/components/contenuto_post.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/pages/profile_page.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                      'assets/icona.png',
                      scale: 5
                  ),
                  IconButton(
                      onPressed: () async {
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        var _loggedId = sp.getString('loggedUserId');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(
                              id: _loggedId!,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.person)),
                ],
              ),
              Divider(
                thickness: 4,
                color: Colors.purple.shade400,
              ),
              const Expanded(child: ContenutoPost()),
            ],
          ),
        ),
      ),
    );
  }
}
