import 'package:flutter/material.dart';
import 'package:projet_final/api/allPilotes.dart';

class AffichagePilotes extends StatelessWidget {
  const AffichagePilotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des pilotes'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.network(
              "https://s3-eu-west-1.amazonaws.com/racingnews-v2-prod/_1125x633_crop_center-center_85_none/FNu15uhXIAIhbG7.jpg?v=1656316506",
              height: 200,
              width: 200,
            ),
          ),
          FutureBuilder<List<dynamic>>(
            future: fetchPilotes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              
              //Récupère la liste de tout les pilotes grâce à l'API
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
                                  "${snapshot.data![i]['givenName']} ${snapshot.data![i]['familyName']}"),
                              subtitle: Text(
                                  "Pilote ${snapshot.data![i]['nationality']} né le ${snapshot.data![i]['dateOfBirth']}"),
                              trailing: const Icon(Icons.info),
                              onTap: () {
                                Navigator.pushNamed(context, '/detailsPilotes',
                                    arguments: {
                                      'prenom': snapshot.data![i]['givenName'],
                                      'nom': snapshot.data![i]['familyName'],
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