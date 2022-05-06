import 'package:flutter/material.dart';
import 'package:social_app/components/app_drawer.dart';
import 'package:social_app/components/barra_inferiore.dart';
import 'package:social_app/components/bottone_profilo.dart';
import 'package:social_app/components/contenuto_post.dart';
import 'package:social_app/components/bottone_add_post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late UniqueKey _key;

  void refreshKey(){
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  void initState() {
    _key = UniqueKey();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.purple
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
            'assets/icona.png'
        ),
        actions: const [
          BottoneProfilo(),
        ],
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0
          ),
          child: Column(
            children: const [
              Divider(
                thickness: 4,
                color: Colors.purple,
              ),
              Expanded(
                child: ContenutoPost(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottoneAddPost(refreshKey),
      bottomNavigationBar: const  BarraInferiore(),
    );
  }
}
