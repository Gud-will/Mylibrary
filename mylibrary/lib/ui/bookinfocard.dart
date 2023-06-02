import 'package:flutter/material.dart';
import 'package:mylibrary/ui/textboxwithplaceholder.dart';
import 'package:mylibrary/ui/uicolors.dart';

class BookInfoCard extends StatelessWidget {
  const BookInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
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
            placeholdervalue: "Harry Potter and the chamber of secrets",
          ),
          TextBoxWthPlaceHolder(
            placeholder: "Title",
            placeholdervalue: "Harry Potter and the chamber of secrets",
          ),
          TextBoxWthPlaceHolder(
            placeholder: "Title",
            placeholdervalue: "Harry Potter and the chamber of secrets",
          ),
        ],
      ),
    );
  }
}

