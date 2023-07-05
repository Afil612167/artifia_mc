import 'dart:convert';
import 'package:artifia_mc/model/ip_model.dart';
import 'package:http/http.dart' as http;

Future<IpModel> fetchIpModel() async {
  final response = await http
      .get(Uri.parse('https://api.ipify.org/?format=json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return IpModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load IpModel');
  }
}