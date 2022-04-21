import 'package:flutter/material.dart';
import 'package:prima_app/components/place_card.dart';
import 'package:prima_app/models/meta_turistica.dart';

class PopularPlace extends StatelessWidget {
  final double height;
  const PopularPlace({required this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: height,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: MetaTuristica.listaMete.length,
            itemBuilder: (context, index) {
              if(MetaTuristica.listaMete[index].rating >= 5){
                return PlaceCard(
                    imageUrl: MetaTuristica.listaMete[index].imageUrl,
                    city: MetaTuristica.listaMete[index].city,
                    country: MetaTuristica.listaMete[index].country
                );
              }
              return const SizedBox(width: 0,);
            }),
      ),
    );
  }
}
