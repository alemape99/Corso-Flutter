import 'package:prima_app/pages/account.dart';
import 'package:prima_app/pages/favorites.dart';
import 'package:prima_app/pages/home.dart';
import 'package:prima_app/pages/login_page.dart';
import 'package:prima_app/pages/reindirizzamento.dart';
import 'package:prima_app/pages/ricerca_page.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

generateRoutes(StreamingSharedPreferences sp){
  return{
    '/' : (context) => const Reindirizzamento(),
    '/login' : (context) => LoginPage(),
    '/home' : (context) => const Home(),
    '/profile' : (context) => const Account(),
    '/favorite' : (context) => Favorites(sp),
    '/search' : (context) => const RicercaPage(),
  };
}