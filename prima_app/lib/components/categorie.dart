import 'package:flutter/material.dart';
import 'package:prima_app/components/category_card.dart';
import 'package:prima_app/components/titolo.dart';
import 'package:prima_app/models/interessi.dart';

class Categorie extends StatelessWidget {
  final double height;
  final List<Interessi> interessiSelezionati;
  final Function (Interessi?) callback;


  const Categorie(this.interessiSelezionati, this.callback,{required this.height, Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Titolo(text: 'Category')),
        SizedBox(
          height: height,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Interessi.values.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    children: [
                      CategoryCard(
                        null,
                        interessiSelezionati.isEmpty,
                        callback,
                        color: Colors.red,
                        icona: Icons.spa,
                        text: 'all',
                      ),
                      CategoryCard(
                        Interessi.values[index],
                        interessiSelezionati.contains(Interessi.values[index]),
                        callback,
                        marginRight: index != (Interessi.values.length - 1),
                      )
                    ],
                  );
                }
                return CategoryCard(
                  Interessi.values[index],
                  interessiSelezionati.contains(Interessi.values[index]),
                  callback,
                  marginRight: index != (Interessi.values.length - 1),
                );
              }),
        ),
      ],
    );
  }
}
