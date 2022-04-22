import 'package:flutter/material.dart';

class Ricerca extends StatelessWidget {
  final bool amIOnHomepage;
  final Function(String)? callback;

  const Ricerca({this.amIOnHomepage = false, this.callback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextField(
              onTap: amIOnHomepage
                  ? () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).pushNamed('/search');
              } : null,
              onChanged: callback,
              readOnly: amIOnHomepage,
              autofocus: !amIOnHomepage,
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () => print('Filtro'),
            icon: Icon(Icons.filter_list_outlined)),
      ],
    );
  }
}
