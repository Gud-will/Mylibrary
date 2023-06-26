import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
double appbarheight=50;
const bgcolor = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color.fromRGBO(81, 162, 221, 0.74),
      Color.fromRGBO(32, 197, 167, 1),
    ],
  ),
);
CarouselOptions carouselOptions = CarouselOptions(
  height: 600,
  autoPlay: true,
  enlargeCenterPage: true,
  aspectRatio: 16 / 9,
  autoPlayCurve: Curves.fastOutSlowIn,
  enableInfiniteScroll: true,
  autoPlayAnimationDuration: const Duration(milliseconds: 700),
  viewportFraction: 0.9,
);
BoxDecoration cardDecorations = BoxDecoration(
  boxShadow: [
    BoxShadow(
        color: Colors.white.withAlpha(100),
        blurRadius: 10.0,
        spreadRadius: 0.0),
  ],
  border: Border.all(
    color: Colors.white10.withAlpha(80),
  ),
  color: Colors.white.withOpacity(0.2),
  borderRadius: BorderRadius.circular(20),
);
