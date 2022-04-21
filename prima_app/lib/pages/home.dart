import 'package:flutter/material.dart';
import 'package:prima_app/components/category_card.dart';
import 'package:prima_app/components/place_card.dart';
import 'package:prima_app/components/titolo.dart';
import 'package:prima_app/models/interessi.dart';
import 'package:prima_app/models/meta_turistica.dart';

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
          CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text('AM'),
          )
        ],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Titolo(text: 'Category')
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: Interessi.values
                        .map((interesse) => CategoryCard(
                            icona: interesse.icon,
                            text: interesse.name,
                            color: interesse.colore))
                        .toList(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  padding: const EdgeInsets.all(13),
                  color: Colors.black12,
                  child: const Icon(Icons.filter_list_outlined),
                ),
              ],
            ),
            const Titolo(text: 'Popular Place'),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: MetaTuristica.listaMete.length,
                    itemBuilder: (context, index) {
                    if(MetaTuristica.listaMete[index].rating >= 5){
                      return PlaceCard(
                          imageUrl: MetaTuristica.listaMete[index].imageUrl,
                          city: MetaTuristica.listaMete[index].city,
                          country: MetaTuristica.listaMete[index].country
                      );
                    }
                    return const SizedBox(width: 0,);
                    }),
              ),
            ),
            const Titolo(text: 'Raccomended Place',),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: MetaTuristica.listaMete.where(
                        (meta) => meta.raccomanded)
                    .map((metaRaccomandata) =>
                    PlaceCard(
                    imageUrl: metaRaccomandata.imageUrl,
                    city: metaRaccomandata.city,
                    country: metaRaccomandata.country)
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
