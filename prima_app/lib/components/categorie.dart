import 'package:flutter/material.dart';
import 'package:prima_app/components/category_card.dart';
import 'package:prima_app/components/titolo.dart';
import 'package:prima_app/models/interessi.dart';

class Categorie extends StatelessWidget {
  final double height;
  const Categorie({required this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Titolo(text: 'Category')
        ),
        SizedBox(
          height: height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: Interessi.values
                .map((interesse) => CategoryCard(
                icona: interesse.icon,
                text: interesse.name,
                color: interesse.colore))
                .toList(),
          ),
        ),
      ],
    );
  }
}
