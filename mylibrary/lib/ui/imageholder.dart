import 'package:flutter/material.dart';

class Imageholder extends StatelessWidget {
  final String imageUrl;
  const Imageholder({ Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  width: 150,
                  height: 230,
                  child: Image(
                    image: NetworkImage(
                      imageUrl,
                    ),
                  ),
                );
  }
}