import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social App') ,
      ),
      body: IconButton(
          onPressed : () async {
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setBool('loggeduserid', false );
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login',
                    (Route<dynamic> route) => false);
          },
          icon: Icon(Icons.close)),
    );
  }
}
