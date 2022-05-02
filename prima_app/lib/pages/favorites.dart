import 'package:flutter/material.dart';
import 'package:prima_app/components/liste_precise_paesi.dart';
import 'package:prima_app/models/meta_turistica.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class Favorites extends StatelessWidget {
  final StreamingSharedPreferences sp;
    const Favorites(this.sp,{ Key? key}) : super(key: key);

    List<MetaTuristica> getMetePreferite(List<String> _preferences) {
      List<MetaTuristica> metePreferite = [];
      for (var meta in MetaTuristica.listaMete) {
        if (_preferences.contains(meta.city)) {
          metePreferite.add(meta);
        }
      }
      return metePreferite;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: PreferenceBuilder<List<String>>(
              preference: sp.getStringList('preferiti', defaultValue: []),
              builder: (context, _preferenceResult){
                List<MetaTuristica> metePreferite = getMetePreferite(_preferenceResult);
                return ListView.builder(
                    itemCount: metePreferite.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        child:
                        ListePrecisePaesi(metePreferite[index]),
                      );
                    }
                );
              }
            ),
      ),
    );
  }
}

