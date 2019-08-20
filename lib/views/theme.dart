import 'package:flutter/material.dart';

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      appBarTheme: AppBarTheme(
        color: Colors.cyan,
        elevation: 2.0,
        iconTheme: IconThemeData(color: Colors.cyanAccent),
      ),
      brightness: Brightness.light,
      primaryColor: Colors.cyan,
      accentColor: Colors.cyanAccent,
      textSelectionColor: Colors.cyan[50],
      textTheme: TextTheme(
        headline: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.cyan[900]),
        title: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.cyan[700]),
        body1: TextStyle(
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          color: Colors.black,
        ),
        button: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        caption: TextStyle(
            fontSize: 10.0,
            fontStyle: FontStyle.italic,
            color: Colors.cyanAccent[400]),
        subhead: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.cyan[900]),
        subtitle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.cyan[800]),
      ),
      buttonTheme: ButtonThemeData(
        padding: EdgeInsets.all(10.0),
        buttonColor: Colors.cyanAccent,
        layoutBehavior: ButtonBarLayoutBehavior.padded,
        textTheme: ButtonTextTheme.normal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      iconTheme: IconThemeData(
        color: Colors.cyan,
      ));
}
