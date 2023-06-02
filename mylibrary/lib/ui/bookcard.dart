import 'package:flutter/material.dart';
import 'package:mylibrary/ui/bookinfocard.dart';
import 'package:mylibrary/ui/imageholder.dart';

class BookCard extends StatefulWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: const [
            BookInfoCard(),
            Imageholder(),
          ],
        ),
      ),
    );
  }
}
