import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchPilotes() async {
  final response = await http.get(Uri.parse('http://ergast.com/api/f1/drivers.json?limit=1000&offset=0'));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body)['MRData']['DriverTable']['Drivers']);
  } else {
    throw Exception('Failed to load Pilotes');
  }
}

class Pilotes {
  final String driverId;
  final String url;
  final String givenName;
  final String familyName;
  final String dateOfBirth;
  final String nationality;

  const Pilotes({
    required this.driverId,
    required this.url,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality
  });

  factory Pilotes.fromJson(Map<String, dynamic> json) {
    return Pilotes(
      driverId: json['driverId'],
      url: json['url'],
      givenName: json['GivenName'],
      familyName: json['FamilyName'],
      dateOfBirth: json['DateOfBirth'],
      nationality: json['Nationality'],
    );
  }
}