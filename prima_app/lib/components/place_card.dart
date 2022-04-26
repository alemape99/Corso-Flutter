import 'package:flutter/material.dart';
import 'package:prima_app/models/meta_turistica.dart';
import 'package:prima_app/pages/dettaglio_meta.dart';

class PlaceCard extends StatelessWidget {
  final MetaTuristica meta;
  const PlaceCard(this.meta, {  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DettaglioMeta(meta),
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(meta.imageUrl),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  meta.city,
                  style: const TextStyle(
                      fontSize: 13
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  const Icon(
                    Icons.pin_drop_outlined,
                    color: Colors.blue,
                  ),
                  Text(meta.country,
                    style: const TextStyle(
                      fontSize: 10,
                        color: Colors.blue
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
