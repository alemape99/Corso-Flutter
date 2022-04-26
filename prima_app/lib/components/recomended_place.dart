import 'package:flutter/material.dart';
import 'package:prima_app/components/place_card.dart';
import 'package:prima_app/models/meta_turistica.dart';

class RacomandedPlace extends StatelessWidget {
  final double height;
  const RacomandedPlace({required this.height,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: MetaTuristica.listaMete.length,
          itemBuilder: (context, index) {
            if(MetaTuristica.listaMete[index].raccomanded){
              return PlaceCard(
                  MetaTuristica.listaMete[index]
              );
            }
            return const SizedBox(width: 0);
          }
      ),
    );
  }
}
