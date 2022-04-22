import 'package:flutter/material.dart';
import 'package:prima_app/models/meta_turistica.dart';

class BackgroundDettagli extends StatelessWidget {
  final MetaTuristica meta;
  const BackgroundDettagli(this.meta, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration:  BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              meta.imageUrl),
        ),
      ),
    );
  }
}
