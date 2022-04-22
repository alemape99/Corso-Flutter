import 'package:flutter/material.dart';

class Titolo extends StatelessWidget {
  final String text;

  const Titolo({required this.text,  Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
    );
  }
}
