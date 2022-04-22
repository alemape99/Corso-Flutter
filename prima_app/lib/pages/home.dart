import 'package:flutter/material.dart';
import 'package:prima_app/components/app_drawer.dart';
import 'package:prima_app/components/categorie.dart';
import 'package:prima_app/components/popular_place.dart';
import 'package:prima_app/components/recomended_place.dart';
import 'package:prima_app/components/ricerca.dart';
import 'package:prima_app/components/titolo.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.pin_drop,
              color: Colors.blue,
            ),
            Text(
              'Italia',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(

                'assets/logo.jpeg'
              ),
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: const [
            Categorie(height: 100),
            Ricerca(amIOnHomepage: true,),
            Titolo(text: 'Popular Place'),
            PopularPlace(height: 150),
            Titolo(
              text: 'Raccomended Place',
            ),
            RacomandedPlace(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
