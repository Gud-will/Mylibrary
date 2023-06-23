import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<List<BookData>> get() async {
    final url = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=harry+potter+and+the+chamber+of+secrets');
    final response = await http.get(url);
    final List<BookData> books = [];
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final jsonItems = json['items'] as List<dynamic>;
      for (var i = 0; i <jsonItems.length; i++) {
        BookData book = BookData.fromJson(jsonItems[i]);
        books.add(book);
      }
    } else {}
    return books;
  }
}

class BookData {
  late final String title;
  late final List<String>? authors;
  late final String summary;
  late final String imageUrl;

  BookData({
    required this.title,
    required this.authors,
    required this.summary,
    required this.imageUrl,
  });
  factory BookData.fromJson(Map<String, dynamic> json) => BookData(
      title: json['volumeInfo']['title']??"",
      authors: (json['volumeInfo']['authors'] as List).map((item)=>item as String).toList(),
      summary: json['volumeInfo']['description']??"",
      imageUrl: json['volumeInfo']['imageLinks']['thumbnail']??"");
}
