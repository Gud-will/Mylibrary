import 'package:flutter/material.dart';
import 'package:mylibrary/ui/uicolors.dart';

class BookInfoCard extends StatelessWidget {
  const BookInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
      margin: const EdgeInsets.only(top: 130),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      constraints: const BoxConstraints(
        maxWidth: 500,
        maxHeight: 700,
      ),
      decoration: cardDecorations,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
          children: const [
             Text(
                "Title:",
                textAlign: TextAlign.left,
              ), Text(
                "Harry potter",
                textAlign: TextAlign.right,
              ),
          ],),
        ],
      ),
    );
  }
}
