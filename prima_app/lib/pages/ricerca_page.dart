import 'package:flutter/material.dart';
import 'package:prima_app/components/filter_drawer.dart';
import 'package:prima_app/components/liste_precise_paesi.dart';
import 'package:prima_app/components/ricerca.dart';
import 'package:prima_app/models/meta_turistica.dart';

class RicercaPage extends StatefulWidget {
  const RicercaPage({Key? key}) : super(key: key);

  @override
  _RicercaPageState createState() => _RicercaPageState();
}

class _RicercaPageState extends State<RicercaPage> {
  late List<MetaTuristica> _risultatiRicerca;

  late int _minRating;
  late int _maxRating;
  String?  _country;

  @override
  void initState() {
    super.initState();
    _minRating = 1;
    _maxRating = 5;

    _risultatiRicerca = MetaTuristica.listaMete;
  }
  void _additionalFilters({
    int minRating = 1,
    int maxRating = 5,
    String? country,

  }){
    setState(() {
      _minRating =minRating;
      _maxRating = maxRating;
      _country = country;


      _risultatiRicerca = _risultatiRicerca.where((risultato){
        return
          risultato.rating >= minRating
          && risultato.rating <= maxRating
          && (country == null || risultato.country == country)
        ;
      }) .toList();
    });
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
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.blue,),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Ricerca', style: TextStyle(
          color: Colors.blue,
        ),),
        actions: const [SizedBox(width: 0,)],
      ),
      endDrawer: FilterDrawer(
        selectedRating: RangeValues(_minRating.toDouble(), _maxRating.toDouble()),
        setFilters: _additionalFilters,
        selectedcountry: _country,
      ),
      endDrawerEnableOpenDragGesture: false,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Ricerca(amIOnHomepage: false, callback: _filtraMete,),
            _risultatiRicerca.length == 0
            ? const Text('Nessun risultato per la ricerca'):
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
