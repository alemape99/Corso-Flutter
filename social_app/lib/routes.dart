import 'package:social_app/home.dart';
import 'package:social_app/pages/login_page.dart';
import 'package:social_app/pages/reindirizzamento.dart';

generateRoutes(){

  return{
    '/' : (context) => const Reindirizzamento(),
    '/login' : (context) => const LoginPage(),
    '/home' : (context) => const Home(),
};
}