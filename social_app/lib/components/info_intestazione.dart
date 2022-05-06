import 'package:flutter/material.dart';

class InfoIntestazione extends StatelessWidget {
  final String testo;
  final IconData icon;
  const InfoIntestazione({required this.icon, required this.testo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
         Icon(
           icon,
           color: Colors.purple,
         ),
        const SizedBox(
          width: 5,
        ),
        Text(
            testo
        ),
      ],
    );
  }
}
