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
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              BackgroundDettagli(meta),
              Positioned(
                left: 24,
                top: 32,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black45,
                  ),
                ),
              ),
              Positioned(
                right: 24,
                top: 32,
                child: ElevatedButton(
                  onPressed: () => print('object'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.black45,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      )
                    ),
                  )),
              Positioned(left: 70, top: 250, child: InfoCitta(meta)),
            ],
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8.0),
           child: SizedBox(
             height: 450,
             child: ListView(
               scrollDirection: Axis.vertical,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Titolo(text: 'Great Place to Visit'),
                     Text(
                       meta.description,
                       style: const TextStyle(fontSize: 12),
                     ),
                     const Titolo(text: 'Picture'),
                     SizedBox(
                       height: 300,
                       child: ListView(
                         scrollDirection: Axis.horizontal,
                         children: [
                           Container(
                           height: 50,
                           color: Colors.green,
                         ),]
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
         ),
        ],
      ),
    );
  }
}
