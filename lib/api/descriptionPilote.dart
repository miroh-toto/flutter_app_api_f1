import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchDetailPilote(String prenom, String nom) async {
  final response = await http.get(Uri.parse('https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&indexpageids&titles=$prenom $nom'));

  if (response.statusCode == 200) {
    
    var pageId = (jsonDecode(response.body)['query']['pageids']).toString();
    pageId = pageId.replaceAll(RegExp(r'[^\w\s]+'),'');

    //print(jsonDecode(response.body)['query']['pages'][pageId]['title']);
    return (jsonDecode(response.body)['query']['pages'][pageId]);
  } else {
    throw Exception('Failed to load description');
  }
}

class DetailPilotes {
  final int pageid;
  final int ns;
  final String title;
  final String extract;

  const DetailPilotes({
    required this.pageid,
    required this.ns,
    required this.title,
    required this.extract
  });

  factory DetailPilotes.fromJson(Map<String, dynamic> json) {
    return DetailPilotes(
      pageid: json['pageid'],
      ns: json['ns'],
      title: json['title'],
      extract: json['extract'],
    );
  }
}