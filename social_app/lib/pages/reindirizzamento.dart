import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/home.dart';
import 'package:social_app/pages/login_page.dart';

class Reindirizzamento extends StatefulWidget {
  const Reindirizzamento({Key? key}) : super(key: key);

  @override
  _ReindirizzamentoState createState() => _ReindirizzamentoState();
}

class _ReindirizzamentoState extends State<Reindirizzamento> {
  bool _loggato = false;

  void initializeSharedPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      _loggato = (sp.getString('loggedUserId') != null);

    });
  }

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return _loggato == true ? const Home() : const LoginPage();
  }
}
