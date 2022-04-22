import 'package:flutter/material.dart';
import 'package:prima_app/components/background_dettagli.dart';
import 'package:prima_app/components/info_citta.dart';
import 'package:prima_app/components/titolo.dart';
import 'package:prima_app/models/meta_turistica.dart';

class DettaglioMeta extends StatelessWidget {
  final MetaTuristica meta;
  const DettaglioMeta(this.meta, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              BackgroundDettagli(meta),
              Positioned(left: 24, top: 32,
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                      child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black45,),
                  ),
              ),
              Positioned(right: 24, top: 32,
                  child: ElevatedButton(
                    onPressed: () => print('object'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Icon(Icons.bookmark, color: Colors.black45,),
                  ),
              ),
              Positioned(
                  left: 70,
                  top: 250,
                  child: InfoCitta(meta)
              ),
            ],
          ),
           Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const Titolo(text: 'Great Place to Visit'),
                  Text(
                    meta.description,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const Titolo(text: 'Picture'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
