import 'package:flutter/material.dart';

enum Interessi{
  mare,
  montagna,
  lago,
  piscina,
  bosco,
  spa
}

extension InteressiExtension on Interessi{
  Color get colore{
    switch(this){
      case Interessi.mare:
        return Colors.blue;

      case Interessi.montagna:
        return Colors.green;

      case Interessi.lago:
        return Colors.blueAccent;

      case Interessi.piscina:
        return Colors.blueGrey;

      case Interessi.bosco:
        return Colors.brown;

      case Interessi.spa:
        return Colors.yellow;
    }
  }
   IconData get icon{
    switch(this){

      case Interessi.mare:
        return Icons.waves_outlined;

      case Interessi.montagna:
        return Icons.terrain_outlined;

      case Interessi.lago:
        return Icons.cottage_outlined;

      case Interessi.piscina:
        return Icons.pool_outlined;

      case Interessi.bosco:
        return Icons.forest_outlined;

      case Interessi.spa:
        return Icons.spa_outlined;

    }
  }

}