import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData icona;
  final String text;
  final Color color;
  final bool marginRight;

  const CategoryCard({required this.icona, required this.text, required this.color, this.marginRight = true,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8),
      margin: marginRight ? const EdgeInsets.only(right: 8) : null,
      decoration: BoxDecoration(
        borderRadius: const
        BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)
                ),
                color: color,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(icona),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text(text),
            )
          ],
        ),
      ),
    );
  }
}
