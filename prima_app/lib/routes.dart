import 'package:flutter/material.dart';
import 'package:prima_app/pages/account.dart';
import 'package:prima_app/pages/favorites.dart';
import 'package:prima_app/pages/global_search.dart';
import 'package:prima_app/pages/home.dart';
import 'package:prima_app/pages/login_page.dart';
import 'package:prima_app/pages/ricerca_page.dart';

generateRoutes(){
  return{
    '/' : (context) => LoginPage(),
    '/home' : (context) => const Home(),
    '/profile' : (context) => const Center(child: Account()),
    '/favorite' : (context) => const Center(child: Favorites()),
    '/search' : (context) => const RicercaPage(),
  };
}