import 'package:flutter/material.dart';
import 'package:prima_app/components/titolo.dart';
import 'package:prima_app/models/meta_turistica.dart';

class InfoCitta extends StatelessWidget {
  final MetaTuristica meta;
  const InfoCitta(this.meta,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 120,
      padding: const EdgeInsets.only(
          top: 5, bottom: 15, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white38, width: 1)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Titolo(text: meta.city),
              Row(
                children: [
                  const Icon(
                    Icons.place_outlined,
                    color: Colors.blue,
                  ),
                  Text(
                    meta.country,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Colors.green.shade800,
                  ),
                  const Text('3 Days',
                    style: TextStyle(
                      fontSize: 12,
                    ),),
                ],
              ),
              Icon(
                Icons.star,
                color: Colors.yellow.shade900,
              ),
              Text(meta.rating.toString()),
              Icon(
                Icons.schedule_outlined,
                color: Colors.purple.shade800,
              ),
              const Text('12:00')
            ],
          ),
        ],
      ),
    );
  }
}
