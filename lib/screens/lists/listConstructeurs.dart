import 'package:flutter/material.dart';
import 'package:projet_final/api/allConstructeurs.dart';

class AffichageConstructeurs extends StatelessWidget {
  const AffichageConstructeurs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des constructeurs'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.network(
              "https://preview.redd.it/ig2goe16yj591.png?auto=webp&s=d05addaee291ed02b4219e4179b5e16ef7d33ed4",
              height: 400,
              width: 400,
            ),
          ),
          FutureBuilder<List<dynamic>>(
            future: fetchConstructeurs(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              //Récupère la liste de toutes les écuries grâce à l'API
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                  "${snapshot.data![i]['name']}"),
                              subtitle: Text(
                                  "Ecurie ${snapshot.data![i]['nationality']}"),
                              trailing: const Icon(Icons.info),
                              onTap: () {
                                Navigator.pushNamed(context, '/detailsConstructeurs',
                                    arguments: {
                                      'ecurie': snapshot.data![i]['name'],
                                    });
                              },
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}