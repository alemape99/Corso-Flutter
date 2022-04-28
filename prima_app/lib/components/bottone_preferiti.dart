import 'package:flutter/material.dart';
import 'package:prima_app/models/meta_turistica.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottonePreferiti extends StatefulWidget {
  final MetaTuristica metaTuristica;
  const BottonePreferiti(this.metaTuristica, {Key? key}) : super(key: key);

  @override
  _BottonePreferitiState createState() => _BottonePreferitiState();
}

class _BottonePreferitiState extends State<BottonePreferiti> {
  late bool favorite;
  void initializeSharedPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final _preferiti = sp.getStringList('preferiti') ?? [];
    setState(() {
      favorite = _preferiti.contains(widget.metaTuristica.city);
    });
  }

  Future<void> addRemovePreferiti() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var _preferiti = sp.getStringList('preferiti') ?? [];
    if (favorite) {
      _preferiti.remove(widget.metaTuristica.city);
    }  else{
      _preferiti.add(widget.metaTuristica.city);
    }
    sp.setStringList('preferiti', _preferiti );
  }
  /*void aggiungiPreferiti() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var _newFavorite = sp.getStringList('preferiti') ?? [];
    _newFavorite.add(widget.metaTuristica.city);
    sp.setStringList('preferiti', _newFavorite );
  }

  void removePreferiti() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var _removeFavorite = sp.getStringList('preferiti') ?? [];
    _removeFavorite.remove(widget.metaTuristica.city);
    sp.setStringList('preferiti', _removeFavorite );
  }*/

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: IconButton(
        onPressed: () async {
          await addRemovePreferiti();
          setState(() {
            favorite =!favorite;
          });
      },
      icon: favorite
          ? const Icon(
        Icons.bookmark,
        color: Colors.black45,
      ) : const Icon(
        Icons.bookmark_outline,
        color: Colors.black45,),
      ),
    );
  }
}
