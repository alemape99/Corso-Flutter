import 'package:flutter/material.dart';
import 'package:prima_app/pages/home.dart';
import 'package:prima_app/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reindirizzamento extends StatefulWidget {
  const Reindirizzamento({Key? key}) : super(key: key);

  @override
  _ReindirizzamentoState createState() => _ReindirizzamentoState();
}

class _ReindirizzamentoState extends State<Reindirizzamento> {
    bool _loggato = false;

  void initializeSharedPreferences() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      _loggato = sp.getBool('loggato') ?? false;
    });
  }

  @override
  void initState(){
    super.initState();
    initializeSharedPreferences();

  }

  @override
  Widget build(BuildContext context) {
    //if per scegliere se entrare in home se loggato oppure no
    return _loggato == true ? const Home() : LoginPage();
    /*if (_loggato == true){
      return const Home();
    }
    else {
      return LoginPage();
    }*/

  }
}
