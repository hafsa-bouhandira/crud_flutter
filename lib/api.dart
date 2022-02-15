// import 'package:dio/dio.dart';

// //import 'contact.dart';

// class PatientsApi {
// final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:80/users'));

//   // final baseUrl = 'http://localhost:8080/users';

//   Future<List> getPatients() async {
//     print(" XXXXXXXXXX TEEEEEEST XXXXXXXXXX");

//     final response = await _dio.get('');
//     print("*******2");
//     // print(response.data);
//     print("*******3");
//     return (response.data);
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class fetchAlbum {
  Future<List> getdata() async {
    final response = await http.get(Uri.parse('http://localhost:80/users'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
