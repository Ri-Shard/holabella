import 'package:flutter/material.dart';

class MyTheme {
  static const Color ocreOscuro = Color(0xFF3C3B21);
  static const Color ocreBase = Color(0xFF625C41);

  static TextStyle basicTextStyle(
      {double? size, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: size ?? 20,
      fontFamily: 'Jost',
      fontWeight: fontWeight ?? FontWeight.w600,
      height: 0.05,
      letterSpacing: 0.10,
    );
  }
}
