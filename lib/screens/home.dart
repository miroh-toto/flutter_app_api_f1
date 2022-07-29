import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("F1 Database App"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/F1.svg/1024px-F1.svg.png",
              height: 100,
              width: 100,
            ),
          ),

          // CARD PILOTES
          Padding(
            padding: const EdgeInsets.all(50),
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.grey.withOpacity(0.4),
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'Pilotes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: (30)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Obtenez la liste de tout les pilotes de F1 de l'histoire",
                      style: TextStyle(fontSize: (20)),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: const Size.fromHeight(70),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/affichagePilotes');
                      },
                      child: const Text("Voir les pilotes")),
                ],
              ),
            ),
          ),

          // CARD CONSTRUCTORS
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.grey.withOpacity(0.4),
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'Écuries',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: (30)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Obtenez la liste de toutes les écuries de F1 de l'histoire",
                      style: TextStyle(fontSize: (20)),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: const Size.fromHeight(70),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/affichageConstructeurs');
                      },
                      child: const Text("Voir les écuries")),
                ],
              ),
            ),
          ),

          // CARD CIRCUITS
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.grey.withOpacity(0.4),
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'Circuits',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: (30)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Obtenez la liste de tout les tracés de F1 de l'histoire",
                      style: TextStyle(fontSize: (20)),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: const Size.fromHeight(70),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/affichageCircuits');
                      },
                      child: const Text("Voir les circuits")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
