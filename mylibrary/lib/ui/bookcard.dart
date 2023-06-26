import 'package:flutter/material.dart';
import 'package:mylibrary/api/apiget.dart';
import 'package:mylibrary/ui/bookinfocard.dart';
import 'package:mylibrary/ui/imageholder.dart';

class BookCard extends StatefulWidget {
  final BookData book;
  const BookCard({Key? key,required this.book}) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          BookInfoCard(title: widget.book.title,authorNames: widget.book.authors!,summary: widget.book.summary,),
          Imageholder(imageUrl:widget.book.imageUrl),
        ],
      ),
    );
  }
}
