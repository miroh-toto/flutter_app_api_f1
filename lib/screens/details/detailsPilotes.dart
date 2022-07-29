import 'package:flutter/material.dart';
import 'package:projet_final/api/descriptionPilote.dart';

class test {
  void GetHome(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    String prenom = arguments['prenom'];
    String nom = arguments['nom'];
    Future<List> datas = fetchDetailPilote(prenom, nom);
    print(datas);
    // Navigator.pushNamed(context, '/detailsPilotes', arguments: datas);
  }
}

class DetailDuPilote extends StatefulWidget {
  const DetailDuPilote({Key? key}) : super(key: key);

  @override
  State<DetailDuPilote> createState() => _DetailDuPiloteState();
}

class _DetailDuPiloteState extends State<DetailDuPilote> {
  late Future<List> datas;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {});

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail du pilote'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          FutureBuilder<List<dynamic>>(
            future: datas,
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
