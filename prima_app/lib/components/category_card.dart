import 'package:flutter/material.dart';
import 'package:prima_app/models/interessi.dart';

class CategoryCard extends StatelessWidget {
  final Interessi? interesse;
  final bool attivo;
  final Function(Interessi?) callback;

  final IconData? icona;
  final String? text;
  final Color? color;
  final bool marginRight;

  const CategoryCard(this.interesse, this.attivo, this.callback, { this.icona,  this.text,  this.color, this.marginRight = true,Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback(interesse);
      },
      child: Container(
        padding: const EdgeInsets.only(right: 8),
        margin: marginRight ? const EdgeInsets.only(right: 8) : null,
        decoration: BoxDecoration(
          borderRadius: const
          BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: Colors.grey,
          ),
          color: attivo ? (interesse?.colore ?? color) : Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)
                  ),
                  color: attivo ?  Colors.white : (interesse?.colore ?? color),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(interesse?.icon ?? icona),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8),
                child: Text(interesse?.name ?? text ?? '' ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
