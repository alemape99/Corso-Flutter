import 'package:flutter/material.dart';
import 'package:prima_app/components/liste_precise_paesi.dart';
import 'package:prima_app/components/place_card.dart';
import 'package:prima_app/components/ricerca.dart';
import 'package:prima_app/models/meta_turistica.dart';

class RicercaPage extends StatefulWidget {
  const RicercaPage({Key? key}) : super(key: key);

  @override
  _RicercaPageState createState() => _RicercaPageState();
}

class _RicercaPageState extends State<RicercaPage> {
  late List<MetaTuristica> _risultatiRicerca;

  @override
  void initState() {
    super.initState();
    _risultatiRicerca = MetaTuristica.listaMete;
  }

  _filtraMete(String parolaDiRicerca){
    if(parolaDiRicerca.isEmpty){
      setState(() {
        _risultatiRicerca = MetaTuristica.listaMete;
      });
    }
    else{
      setState(() {
        _risultatiRicerca = MetaTuristica.listaMete.where((meta) =>
            meta.city.toLowerCase().contains(parolaDiRicerca.toLowerCase())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Ricerca', style: TextStyle(
          color: Colors.blue,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Ricerca(amIOnHomepage: false, callback: _filtraMete,),
            _risultatiRicerca.length == 0
            ? Text('Nessun risultato per la ricerca'):
            Expanded(
              child: ListView.builder(
                itemCount: _risultatiRicerca.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: ListePrecisePaesi(_risultatiRicerca[index]),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
