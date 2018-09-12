import 'dart:async';
import 'dart:convert';
import 'package:statisticsapp/model/data.dart';
import 'package:http/http.dart' as http;

Future<Data> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Data.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

