import 'package:flutter/material.dart';

class FotoDettaglio extends StatelessWidget {
  const FotoDettaglio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
              "https://media.istockphoto.com/photos/business-towers-and-green-leaves-picture-id1076482942?k=20&m=1076482942&s=612x612&w=0&h=jBsHsP9VceUYGNro_22fCzC8j5-RL2YIO7qaBFaXzVI="),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
