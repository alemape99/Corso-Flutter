import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/components/app_drawer.dart';
import 'package:social_app/components/barra_inferiore.dart';
import 'package:social_app/components/bottone_aggiungi_modifica_post.dart';
import 'package:social_app/components/bottone_profilo.dart';
import 'package:social_app/components/contenuto_post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _userId;
  late UniqueKey _key;

  initUserId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      _userId = sp.getString('loggedUserId');
    });
    if (_userId == null) {
      throw Exception('Utente non loggato');
    }
  }
  void refreshKey() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  void initState() {
    _key = UniqueKey();
    super.initState();
    initUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.purple),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset('assets/icona.png'),
        actions: const [
          BottoneProfilo(),
        ],
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
      floatingActionButton: _userId != null
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () async {
                var edited = await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) =>
                        BottoneAggiungiModificaPost(_userId!));
                if (edited == true) {
                  setState(() {
                    _key = UniqueKey();
                  });
                }
              })
          : null,
      bottomNavigationBar: const BarraInferiore(),
    );
  }
}
