import 'package:flutter/material.dart';
const bgcolor=BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromRGBO(81, 162, 221, 0.74),
              Color.fromRGBO(32, 197, 167, 1),
            ],
          ),
        );
BoxDecoration cardDecorations=BoxDecoration(
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