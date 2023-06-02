import 'package:flutter/material.dart';

class TextBoxWthPlaceHolder extends StatelessWidget {
  String placeholder,placeholdervalue;
  TextBoxWthPlaceHolder({ Key? key,required this.placeholder,required this.placeholdervalue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
                placeholder+":",
                textAlign: TextAlign.left,
              ), Text(
                placeholdervalue,
                textAlign: TextAlign.right,
              ),
            ],
          );
  }
}