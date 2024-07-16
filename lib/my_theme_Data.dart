import 'package:flutter/material.dart';

ThemeData myLightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.transparent,elevation: 0,centerTitle: true,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      
    ),
    bodyMedium:TextStyle(
      fontSize: 17,
    )
  ),
);
