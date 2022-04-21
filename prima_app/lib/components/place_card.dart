import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final String imageUrl;
  final String city;
  final String country;
  const PlaceCard({required this.imageUrl, required this.city, required this.country, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                city,
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
                Text(country,
                  style: const TextStyle(
                    fontSize: 10,
                      color: Colors.blue
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
