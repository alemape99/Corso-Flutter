import 'package:flutter/material.dart';
import 'package:prima_app/pages/account.dart';
import 'package:prima_app/pages/favorites.dart';
import 'package:prima_app/pages/global_search.dart';
import 'package:prima_app/pages/home.dart';

generateRoutes(){
  return{
    '/' : (context) => const Home(),
    '/profile' : (context) => const Center(child: Account()),
    '/favorite' : (context) => const Center(child: Favorites()),
    '/mete' : (context) => const Center(child: GlobalSearch()),
  };
}