import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchCircuits() async {
  final response = await http.get(Uri.parse('http://ergast.com/api/f1/circuits.json?limit=1000&offset=0'));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body)['MRData']['CircuitTable']['Circuits']);
  } else {
    throw Exception('Failed to load Pilotes');
  }
}

class Circuits {
  final String circuitId;
  final String url;
  final String circuitName;
  final double lat;
  final double long;
  final String locality;
  final String country;

  const Circuits({
    required this.circuitId,
    required this.url,
    required this.circuitName,
    required this.lat,
    required this.long,
    required this.locality,
    required this.country,
  });

  factory Circuits.fromJson(Map<String, dynamic> json) {
    return Circuits(
      circuitId: json['circuitId'],
      url: json['url'],
      circuitName: json['circuitName'],
      lat: json['lat'],
      long: json['long'],
      locality: json['locality'],
      country: json['country'],
    );
  }
}