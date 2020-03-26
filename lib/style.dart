import 'package:flutter/material.dart';

const mainTitleStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 32,
);

const mainSubtitleStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);

const searchBarColor = Color(0xFF21243C);

var searchBarDecoration = BoxDecoration(
  color: searchBarColor,
  borderRadius: BorderRadius.circular(40),
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 10),
      blurRadius: 15,
      color: Colors.black54,
    ),
  ],
);
