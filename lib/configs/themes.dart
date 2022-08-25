import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    focusColor: Colors.black,
    highlightColor: Color.fromRGBO(249, 77, 30, 1),
  );
  static final dark = ThemeData.dark().copyWith(
    focusColor: Colors.white,
    highlightColor: Color.fromRGBO(249, 77, 30, 1),
  );
}
