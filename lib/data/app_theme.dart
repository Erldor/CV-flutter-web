import 'package:flutter/material.dart';

class AppTheme{

  AppTheme();

  static Color baseGreen = Color.fromARGB(255, 0, 204, 153);
  static Color baseGrey = Color.fromARGB(255, 223, 223, 223);

  static ThemeData darkTheme()
  {
    return ThemeData(
      fontFamily: 'Roboto-Bold',
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontWeight: FontWeight.bold),
        bodySmall: TextStyle(fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontWeight: FontWeight.bold),
        labelLarge: TextStyle(fontWeight: FontWeight.bold),
        labelMedium: TextStyle(fontWeight: FontWeight.bold),
        labelSmall: TextStyle(fontWeight: FontWeight.bold),
      ).apply(
        fontFamily: 'Roboto',
        displayColor: Color.fromARGB(255, 223, 223, 223),
        bodyColor: Color.fromARGB(255, 223, 223, 223),
      ),
      scaffoldBackgroundColor: Color.fromARGB(255, 52, 52, 52), 
      appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 82, 82, 82), titleTextStyle: TextStyle(color: Color.fromARGB(255, 223, 223, 223)))
    );
  }
}
