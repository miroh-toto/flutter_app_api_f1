import 'package:flutter/material.dart';
import 'package:projet_final/api/descriptionConstructeur.dart';

class DetailsConstructeurs extends StatelessWidget {
  const DetailsConstructeurs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    String ecurie = arguments['ecurie'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Détail de l'écurie"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          FutureBuilder<List<dynamic>>(
            future: fetchDetailConstructeurs(ecurie),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Card(
                        child: Column(
                          children: const <Widget>[
                            ListTile(
                              title: Text("Titre"),
                              subtitle: Text("Description"),
                              trailing: Icon(Icons.info),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Padding(
                  padding: const EdgeInsets.all(50),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.grey.withOpacity(0.4),
                    child: Column(
                      children: [
                        Builder(builder: (context) {
                          return const ListTile(
                            title: Text(
                              'Pas de données',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: (30)),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
