import 'package:flutter/material.dart';
import 'package:prima_app/pages/home.dart';

generateRoutes(){
  return{
    '/' : (context) => const Home(),
    '/profile' : (context) => const Center(child: Text('Profilo'),),
    '/details' : (context) => const Center(child: Text('Deatils'),),
    '/favourite' : (context) => const Center(child: Text('Preferiti'),),
    '/mete' : (context) => const Center(child: Text('Mete'),),
  };
}