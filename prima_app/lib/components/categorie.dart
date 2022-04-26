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
                      const CategoryCard(
                        color: Colors.red,
                        icona: Icons.spa,
                        text: 'all',
                      ),
                      CategoryCard(
                        color: Interessi.values[index].colore,
                        icona: Interessi.values[index].icon,
                        text: Interessi.values[index].name,
                        marginRight: index != (Interessi.values.length - 1),
                      )
                    ],
                  );
                }
                return CategoryCard(
                  color: Interessi.values[index].colore,
                  icona: Interessi.values[index].icon,
                  text: Interessi.values[index].name,
                  marginRight: index != (Interessi.values.length - 1),
                );
              }),
        ),
      ],
    );
  }
}
