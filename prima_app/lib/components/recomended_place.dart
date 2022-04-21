import 'package:flutter/material.dart';
import 'package:prima_app/components/place_card.dart';
import 'package:prima_app/models/meta_turistica.dart';

class RecomendedPlace extends StatelessWidget {
  const RecomendedPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: MetaTuristica.listaMete.where(
                (meta) => meta.raccomanded)
            .map((metaRaccomandata) =>
            PlaceCard(
                imageUrl: metaRaccomandata.imageUrl,
                city: metaRaccomandata.city,
                country: metaRaccomandata.country)
        ).toList(),
      ),
    );
  }
}
