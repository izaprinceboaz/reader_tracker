import 'dart:convert';

import '../models/book.dart';
import 'package:http/http.dart' as http;

class Network {

  static const String _baseUrl =
      "https://www.googleapis.com/books/v1/volumes";

  static const String _apiKey = 'AIzaSyCcJZIgy923jMvE7nCqfNC-rQ5h70Qbzl8';

  Future<List<Book>> searchBooks(String query) async{

    var url = Uri.parse('$_baseUrl?q=$query&key=$_apiKey');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        var data = json.decode(response.body);

        if (data['items'] != null && data['items'] is List) {
          List<Book> books = (data['items'] as List<dynamic>)
                              .map((book) => Book.fromJson(book as Map<String, dynamic>))
                              .toList();
          return books;
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }

  }
}