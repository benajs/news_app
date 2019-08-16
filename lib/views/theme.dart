import 'package:flutter/material.dart';

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      appBarTheme: AppBarTheme(
        color: Colors.amberAccent[700],
        elevation: 2.0,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      brightness: Brightness.light,
      primaryColor: Colors.orange,
      accentColor: Colors.orangeAccent,
      textSelectionColor: Colors.amberAccent,
      textTheme: TextTheme(
        headline: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.amber[700]),
        title: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.amber[500]),
        body1: TextStyle(
            fontSize: 14.0,
            fontStyle: FontStyle.italic,
            color: Colors.amber[400]),
      ),
      buttonTheme: ButtonThemeData(
        padding: EdgeInsets.all(8.0),
        buttonColor: Colors.orange,
        layoutBehavior: ButtonBarLayoutBehavior.padded,
        textTheme: ButtonTextTheme.normal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      iconTheme: IconThemeData(
        color: Colors.deepOrange,
      ));
}
