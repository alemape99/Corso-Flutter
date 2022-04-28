import 'package:flutter/material.dart';
import 'package:prima_app/components/liste_precise_paesi.dart';
import 'package:prima_app/models/meta_turistica.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites extends StatefulWidget {
    const Favorites({ Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<MetaTuristica> listmete = [];

  void initializeSharedPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final _preferiti = sp.getStringList('preferiti') ?? [];
    setState(() {
      MetaTuristica.listaMete.forEach((meta) {
        if (_preferiti.contains(meta.city)) {
          listmete.add(meta);
        }
      });
    });
  }

  @override
  void initState(){
    super.initState();
    initializeSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
            itemCount: listmete.length,
            itemBuilder: (context, index) {
        return Container(
          height: 100,
          child:
          ListePrecisePaesi(MetaTuristica.listaMete[index]),
        );}),
      ),
    );
  }
}
