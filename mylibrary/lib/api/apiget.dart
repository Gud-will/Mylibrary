import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  Future<List<BookData>> get(String query) async {
    final url = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q='+query);
    final response = await http.get(url);
    final List<BookData> books = [];
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final jsonItems = json['items'] as List<dynamic>;
      for (var i = 0; i < jsonItems.length; i++) {
        try
        {
          jsonItems[i]['volumeInfo']['imageLinks']['thumbnail'];
        }
        catch(e){
          jsonItems[i]['volumeInfo']['imageLinks']={'thumbnail':"https://img.freepik.com/free-vector/no-data-concept-illustration_114360-536.jpg?w=740&t=st=1687613434~exp=1687614034~hmac=cf608dbab29481b3843be9d5f54fb4ee631e3f1236e1a301226b70b60279638a"};
        }
        try{
          BookData book = BookData.fromJson(jsonItems[i]);
          books.add(book);
        }
        catch(e){

        }
      }
    } else {
    }
    return books;
  }
}

class BookData {
  late final String title;
  late final List<String>? authors;
  late final String summary;
  late final String imageUrl;
  late final String id;
  BookData({
    required this.title,
    required this.authors,
    required this.summary,
    required this.imageUrl,
    required this.id,
  });
  factory BookData.fromJson(Map<String, dynamic> json) => BookData(
      title: json['volumeInfo']['title'] ?? "",
      authors: (json['volumeInfo']['authors'] as List)
          .map((item) => item as String)
          .toList(),
      summary: json['volumeInfo']['description'] ?? "",
      id: json['id'] ?? "",
      imageUrl: json['volumeInfo']['imageLinks']['thumbnail'] ?? "");
  factory BookData.fromJsonfirebase(Map<String, dynamic> json) => BookData(
      title: json['title'] ?? "",
      authors: (json['authors'] as List)
          .map((item) => item as String)
          .toList(),
      summary: json['summary'] ?? "",
      id: json['id'] ?? "",
      imageUrl: json['imageUrl'] ?? "");
      
  Map<String, Object?> toJson() {
    return {
        'title': title,
        'authors': authors,
        'summary': summary,
        'imageUrl': imageUrl,
    };
  }
}
