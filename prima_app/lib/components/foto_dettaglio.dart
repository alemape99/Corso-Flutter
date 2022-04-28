import 'package:flutter/material.dart';

class FotoDettaglio extends StatelessWidget {
  final String image;
  const FotoDettaglio({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(
              image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
