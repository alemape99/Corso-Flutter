import 'package:flutter/material.dart';
import 'package:prima_app/components/liste_precise_paesi.dart';
import 'package:prima_app/models/meta_turistica.dart';

class Favorites extends StatefulWidget {
    const Favorites({ Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late List<MetaTuristica> _risultatiRicerca;

  @override
  void initState(){
    super.initState();
    _risultatiRicerca = MetaTuristica.listaMete;
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
            itemCount: _risultatiRicerca.length,
            itemBuilder: (context, index) {
        return Container(
          height: 100,
          child:
          ListePrecisePaesi(_risultatiRicerca[index]),
        );}),
      ),
    );
  }
}
