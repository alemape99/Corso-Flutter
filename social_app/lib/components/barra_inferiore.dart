import 'package:flutter/material.dart';
import 'package:social_app/components/bottone_profilo.dart';

class BarraInferiore extends StatelessWidget {
  const BarraInferiore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () => print('test'),
                icon: const Icon(Icons.home, color: Colors.purple,)
            ),
           const BottoneProfilo()
          ]
      ),
    );
  }
}
