import 'package:flutter/material.dart';
import 'package:prima_app/components/background_dettagli.dart';
import 'package:prima_app/components/foto_dettaglio.dart';
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
                        )),
                  )),
              Positioned(left: 70, top: 250, child: InfoCitta(meta)),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 450,
                child: ListView(
                  padding: EdgeInsets.zero,
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
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const  [
                              FotoDettaglio(),
                              FotoDettaglio(),
                              FotoDettaglio(),
                              FotoDettaglio(),
                              FotoDettaglio(),
                              FotoDettaglio(),
                              FotoDettaglio(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: const NetworkImage('https://www.venezia.net/wp-content/uploads/2012/09/mappa.jpg')
                              )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("\$ ${meta.minPrice}",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('Minimum Price')
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () => print('Compra'),
                                  child: const Text(
                                    'Book Now'
                                  ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}