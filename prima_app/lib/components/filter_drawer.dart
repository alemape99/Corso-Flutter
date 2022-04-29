import 'package:flutter/material.dart';
import 'package:prima_app/models/meta_turistica.dart';

class FilterDrawer extends StatefulWidget {
  final RangeValues selectedRating;
  final String? selectedcountry;
  final bool available;
  final bool raccomanded;

  final Function({int minRating, int maxRating, String? country, bool? available, bool? raccomanded}) setFilters;

  const FilterDrawer(
      {required this.selectedRating, required this.setFilters, this.selectedcountry, this.available = false, this.raccomanded = false, Key? key})
      : super(key: key);

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  late RangeValues _selectedRating;
  late List<String> _countryList;
  String? _selectedCountry;
  late bool? _avaliable;
  late bool? _raccomanded;

  @override
  void initState() {
    super.initState();
    _countryList =
        MetaTuristica.listaMete.map((meta) => meta.country).toSet().toList();
    _countryList.sort();
    _selectedRating = widget.selectedRating;
    _selectedCountry = widget.selectedcountry;
    _avaliable = widget.available;
    _raccomanded = widget.raccomanded;


  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.clear_outlined)),
                const SizedBox(
                  width: 80,
                ),
                const Text('Filtri', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
                child: Form(
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                  'Rating', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)
                              ),
                              Icon(Icons.star, color: Colors.amber,)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                                '(Attualmente selezionati: da ${_selectedRating.start.toString().substring(0, 1)} a ${_selectedRating.end.toString().substring(0, 1)}) '),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('1'),
                          const Icon(Icons.star, color: Colors.amber,size: 12),
                          Expanded(
                            child: RangeSlider(
                              min: 1,
                              max: 5,
                              values: _selectedRating,
                              divisions: 4,
                              onChanged: (RangeValues value) {
                                setState(() {
                                  _selectedRating = value;

                                });
                              },
                              labels: RangeLabels(
                                _selectedRating.start
                                    .toString()
                                    .substring(0, 1),
                                _selectedRating.end.toString().substring(0, 1),
                              ),
                            ),
                          ),
                          const Text('5'),
                          const Icon(Icons.star, color: Colors.amber,size: 12),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child:  Row(
                          children: const [
                            Text('Country Selection',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, 
                                    fontSize: 20),
                            ),
                            Icon(Icons.flag_outlined, color: Colors.grey)
                          ],
                        ),
                      ),
                      FormField(
                        builder: (context) {
                          return InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder()
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String?>(
                                  isDense: true,
                                  value: _selectedCountry,
                                  items: <DropdownMenuItem<String?>>[
                                    const DropdownMenuItem(
                                      child: Text('Nessuno Stato selezionato'),
                                      value: null,
                                    )
                                  ] +
                                      _countryList
                                          .map(
                                            (country) => DropdownMenuItem<String?>(
                                          child: Text(country),
                                          value: country,
                                        ),
                                      )
                                          .toList(),
                                  onChanged: (metaSelezionata) {
                                    setState(() {
                                      _selectedCountry = metaSelezionata;
                                    });
                                  }),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: const [
                          Text('Availability',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                          ),
                          Icon(Icons.done_outlined)
                        ],
                      ),
                      SwitchListTile(
                        title: const Text('Available'),
                          value: _avaliable ?? false,
                          onChanged: (toogle){
                          setState(() {
                            _avaliable = toogle;
                          });
                          }
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //Aggiungere min price e max price
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: const [
                          Text('Raccomanded',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.thumb_up_alt_outlined),
                          )
                        ],
                      ),
                      SwitchListTile(
                          title: const Text('Raccomanded'),
                          value: _raccomanded ?? false,
                          onChanged: (toogle){
                            setState(() {
                              _raccomanded = toogle;
                            });
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _raccomanded = null;
                          _avaliable = null;
                          _selectedCountry = null;
                          _selectedRating = const RangeValues(1,5);
                        });
                      },
                      child: const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  Text('Reset'),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        widget.setFilters(
                            minRating: _selectedRating.start.toInt(),
                            maxRating: _selectedRating.end.toInt(),
                            country: _selectedCountry,
                            available: _avaliable == false ? null : _avaliable,
                            raccomanded: _raccomanded == false ? null : _raccomanded
                        );
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Applica'),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
