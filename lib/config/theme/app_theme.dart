import "package:flutter/material.dart";

class AppTheme {
  // ThemeData getTheme() => ThemeData(
  //   useMaterial3: true,
  //   colorSchemeSeed: const Color(0xff2862F5),
  // );

  // Tema Oscuro
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.white,
    brightness: Brightness.dark
  );
}
