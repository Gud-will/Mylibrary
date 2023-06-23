import 'package:flutter/material.dart';

class Imageholder extends StatelessWidget {
  const Imageholder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
                  width: 150,
                  height: 230,
                  child: Image(
                    image: NetworkImage(
                      "https://m.media-amazon.com/images/I/81THMAxo+pL._AC_UF1000,1000_QL80_.jpg",
                    ),
                  ),
                );
  }
}