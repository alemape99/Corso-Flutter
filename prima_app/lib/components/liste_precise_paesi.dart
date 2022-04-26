import 'package:flutter/material.dart';
import 'package:prima_app/models/meta_turistica.dart';
import 'package:prima_app/pages/dettaglio_meta.dart';

class ListePrecisePaesi extends StatelessWidget {
  final MetaTuristica meta;

  const ListePrecisePaesi(this.meta, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DettaglioMeta(meta),
          ),
        ),
        child: Container(
          height: 600,
          child: Card(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(meta.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right:8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(meta.city, style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20
                            ),),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text('Another journey chamber way yet'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.star_outlined, color: Colors.yellow.shade900,),
                                  Text(meta.rating.toString()),
                                  Row(
                                    children: [
                                      const Icon(Icons.place_outlined, color: Colors.blue,),
                                      Text(meta.country)
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
