import 'package:flutter/material.dart';
import 'package:projet_final/api/allCircuits.dart';

class AffichageCircuits extends StatelessWidget {
  const AffichageCircuits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des circuits'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.network(
              "https://i.pinimg.com/736x/a6/54/53/a65453ae2f011c4071adf7e89df07e0a.jpg",
              height: 500,
              width: 200,
            ),
          ),
          FutureBuilder<List<dynamic>>(
            future: fetchCircuits(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                //Récupère la liste de tout les circuits grâce à l'API
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
                              title:
                                  Text("${snapshot.data![i]['circuitName']}"),
                              subtitle: Text(
                                  "Circuit situé à ${snapshot.data![i]['Location']['locality']}"),
                              trailing: const Icon(Icons.info),
                              onTap: () {
                                Navigator.pushNamed(context, '/detailsCircuits',
                                    arguments: {
                                      'circuitName': snapshot.data![i]
                                          ['circuitName'],
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