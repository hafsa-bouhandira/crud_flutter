import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontapp/patient.dart';
import 'package:http/http.dart' as http;
import 'patient.dart';

class fetchAlbum {
  Future<List> getdata() async {
    final response = await http.get(Uri.parse('http://localhost:80/users'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("*****************");
      return jsonDecode(response.body);

      // return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<http.Response> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://localhost:80/users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }

  createAlbum(String name, String lastName, String age) {
    print("*****************11");

    final res = http.post(
      Uri.parse('http://localhost:80/users'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "lastName": lastName,
        "age": age,
      }),
    );
  }
}
