import 'package:flutter/material.dart';

class Ricerca extends StatelessWidget {
  const Ricerca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.all(13),
          color: Colors.black12,
          child: const Icon(Icons.filter_list_outlined),
        ),
      ],
    );
  }
}
