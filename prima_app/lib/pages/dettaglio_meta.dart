import 'package:flutter/material.dart';
import 'package:prima_app/components/background_dettagli.dart';
import 'package:prima_app/components/bottone_preferiti.dart';
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
                child: Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.blue,
                      )),
                ),
              ),
              Positioned(
                  right: 24,
                  top: 32,
                  child: BottonePreferiti(meta)),
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
                            children: const [
                              FotoDettaglio(image: 'https://www.travel365.it/foto/venezia-italia-barche-citta-urbano.jpg'),
                              FotoDettaglio(image: 'https://static.myluxury.it/myluxury/fotogallery/780X0/87221/la-citta-piu-bella-del-mondo-venezia.jpg',),
                              FotoDettaglio(image: 'https://www.immobiliare.it/news/app/uploads/2010/06/vivere-citta.jpg',),
                              FotoDettaglio(image: 'https://images.lonelyplanetitalia.it/uploads/astana?q=80&p=slider&s=2f5f911584e91b64cd36b243f4615814',),
                              FotoDettaglio(image: 'https://www.milanocittastato.it/wp-content/uploads/2020/11/image.jpg',),
                              FotoDettaglio(image: 'https://www.apotecanatura.it/wp-content/uploads/2020/07/Immagine-1-Copertina-2-1-1024x684.jpg' ,),
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
                                    image: NetworkImage(
                                        'https://www.venezia.net/wp-content/uploads/2012/09/mappa.jpg'))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "\$ ${meta.minPrice}",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text('Minimum Price')
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () => print('Compra'),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 32),
                                  child: Text('Book Now'),
                                ),
                              ),
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
