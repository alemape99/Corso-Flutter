import 'package:flutter/material.dart';
import 'package:prima_app/components/titolo.dart';
import 'package:prima_app/models/meta_turistica.dart';

class FilterDrawer extends StatefulWidget {
  final RangeValues selectedRating;
  final String? selectedcountry;
  final Function({int minRating, int maxRating, String? country}) setFilters;

  const FilterDrawer(
      {required this.selectedRating, required this.setFilters, this.selectedcountry, Key? key})
      : super(key: key);

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  late RangeValues _selectedRating;
  late List<String> _countryList;
  String? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedRating = widget.selectedRating;
    _selectedCountry = widget.selectedcountry;
    _countryList =
        MetaTuristica.listaMete.map((meta) => meta.country).toSet().toList();
    _countryList.sort();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Titolo(text: 'Filtri'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  child: ListView(
                    children: [
                      Text(
                          'Rating (Attualmente selezionati: da ${_selectedRating.start.toString().substring(0, 1)}, a ${_selectedRating.end.toString().substring(0, 1)}) '),
                      Row(
                        children: [
                          const Text('1'),
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
                        ],
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
                      onPressed: () => print('reset'),
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
