import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  String? _paroladiRicerca;
  late int _minRating;
  late int _maxRating;
  String? _country;
  bool? _available;
  bool? _raccomanded;
  late final GlobalKey<ScaffoldState> _scaffoldKey;


  @override
  void initState() {
    super.initState();

    _minRating = 1;
    _maxRating = 5;
    _risultatiRicerca = MetaTuristica.listaMete;
    _scaffoldKey = GlobalKey();

    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      final modalArgs = ModalRoute.of(context)?.settings.arguments ?? {};

      if( modalArgs is Map <String, bool>
      && modalArgs ['openDrawer']== true){
        _scaffoldKey.currentState?.openEndDrawer();
      }
    });
  }

  void _setadditionalFilters({
    int minRating = 1,
    int maxRating = 5,
    String? country,
    bool? available,
    bool? raccomanded

  }) {
    _minRating = minRating;
    _maxRating = maxRating;
    _country = country;
    _available = available;
    _raccomanded = raccomanded;

    _filtraMete(_paroladiRicerca ?? '');
  }

  bool _additionalFiltersfor(MetaTuristica meta) {
    return meta.rating >= _minRating &&
        meta.rating <= _maxRating &&
        (_country == null || meta.country == _country) &&
        (_available == null ||
            _available == false ||
            meta.available == _available) &&
    (_raccomanded == null ||
        _raccomanded == false ||
        meta.raccomanded == _raccomanded);
  }

  void _filtraMete(String parolaDiRicerca) {
    _paroladiRicerca = parolaDiRicerca;
    if (parolaDiRicerca.isEmpty) {
      setState(() {
        _risultatiRicerca = MetaTuristica.listaMete
            .where((meta) => _additionalFiltersfor(meta))
            .toList();
      });
    } else {
      setState(() {
        _risultatiRicerca = MetaTuristica.listaMete
            .where((meta) =>
                meta.city.toLowerCase().contains(parolaDiRicerca.toLowerCase()) && _additionalFiltersfor(meta))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Ricerca',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        actions: const [
          SizedBox(
            width: 0,
          )
        ],
      ),
      endDrawer: FilterDrawer(
        selectedRating:
            RangeValues(_minRating.toDouble(), _maxRating.toDouble()),
        setFilters: _setadditionalFilters,
        selectedcountry: _country,
        available: _available ?? false,
        raccomanded: _raccomanded ?? false,
      ),
      endDrawerEnableOpenDragGesture: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Ricerca(
              amIOnHomepage: false,
              callback: _filtraMete,
            ),
            if (_risultatiRicerca.isNotEmpty)
              Text('Risultati trovati: ${_risultatiRicerca.length}'),
            _risultatiRicerca.isEmpty
                ? const Text('Nessun risultato per la ricerca')
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListView.builder(
                          itemCount: _risultatiRicerca.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              child:
                                  ListePrecisePaesi(_risultatiRicerca[index]),
                            );
                          }),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
