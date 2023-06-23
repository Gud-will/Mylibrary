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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: const Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            BookInfoCard(),
            Imageholder(),
          ],
      ),
    );
  }
}
