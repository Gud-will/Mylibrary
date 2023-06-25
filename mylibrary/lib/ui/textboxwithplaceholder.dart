import 'package:flutter/material.dart';

class TextBoxWthPlaceHolder extends StatelessWidget {
  final String placeholder, placeholdervalue;
  const TextBoxWthPlaceHolder(
      {Key? key, required this.placeholder, required this.placeholdervalue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          placeholder + ":",
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
        SizedBox(
          width: 200,
          child: Text(
            placeholdervalue,
            textAlign: TextAlign.right,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
