import 'package:flutter/material.dart';
import 'package:mylibrary/api/apiget.dart';

class SearchList extends StatelessWidget {
  final List<BookData> books;
  const SearchList({Key? key,required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(books[index].imageUrl),
          title: Text(books[index].title),
          subtitle: Text(books[index].authors![0]),
        );
      }),
    );
  }
}
