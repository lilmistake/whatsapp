import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    listTileTheme: const ListTileThemeData(
      subtitleTextStyle: TextStyle(color: Color.fromRGBO(137, 150, 159, 1)),
    ),
    colorScheme: const ColorScheme.dark(
        background: Color.fromRGBO(18, 27, 34, 1),
        primary: Color.fromRGBO(31, 44, 52, 1),
        secondary: Color.fromRGBO(1, 168, 132, 1),
        tertiary: Color.fromRGBO(137, 150, 159, 1)));
