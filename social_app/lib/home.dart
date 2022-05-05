import 'package:flutter/material.dart';
import 'package:social_app/components/app_drawer.dart';
import 'package:social_app/components/bottone_profilo.dart';
import 'package:social_app/components/contenuto_post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.purple.shade400,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset('assets/icona.png'),
        actions: const [
          BottoneProfilo(),
        ],
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Divider(
                thickness: 4,
                color: Colors.purple.shade400,
              ),
              const Expanded(
                child: ContenutoPost(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
