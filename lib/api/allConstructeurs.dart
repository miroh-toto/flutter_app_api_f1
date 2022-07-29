import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchConstructeurs() async {
  final response = await http.get(Uri.parse('http://ergast.com/api/f1/constructors.json?limit=1000&offset=0'));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body)['MRData']['ConstructorTable']['Constructors']);
  } else {
    throw Exception('Failed to load Pilotes');
  }
}

class Constructeurs {
  final String constructorId;
  final String url;
  final String name;
  final String nationality;

  const Constructeurs({
    required this.constructorId,
    required this.url,
    required this.name,
    required this.nationality
  });

  factory Constructeurs.fromJson(Map<String, dynamic> json) {
    return Constructeurs(
      constructorId: json['driverId'],
      url: json['url'],
      name: json['GivenName'],
      nationality: json['Nationality'],
    );
  }
}