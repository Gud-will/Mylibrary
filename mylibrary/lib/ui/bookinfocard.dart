import 'package:flutter/material.dart';
import 'package:mylibrary/ui/textboxwithplaceholder.dart';
import 'package:mylibrary/ui/uicolors.dart';

class BookInfoCard extends StatelessWidget {
  final String title;
  final List<String> authorNames;
  final String summary;
  const BookInfoCard(
      {Key? key,
      required this.title,
      required this.authorNames,
      required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var author = "";
    for (var i = 0; i < authorNames.length; i++) {
      author += authorNames[i];
      if (i != authorNames.length - 1) {
        author += ", ";
      }
    }
    return AspectRatio(
      aspectRatio: 9 / 15,
      child: Container(
        margin: const EdgeInsets.only(top: 130),
        padding: const EdgeInsets.only(
          top: 130,
          bottom: 10,
          right: 10,
          left: 10,
        ),
        constraints: const BoxConstraints(
          maxWidth: 500,
          maxHeight: 700,
        ),
        decoration: cardDecorations,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBoxWthPlaceHolder(
              placeholder: "Title",
              placeholdervalue: title,
            ),
            TextBoxWthPlaceHolder(
              placeholder: "Authors:",
              placeholdervalue: author,
            ),
            TextBoxWthPlaceHolder(
              placeholder: "summary",
              placeholdervalue: summary,
            ),
          ],
        ),
      ),
    );
  }
}
