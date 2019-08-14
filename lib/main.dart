import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //Theme
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.brown,
      accentColor: Colors.orangeAccent,
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
          headline: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind')),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.orange,
        layoutBehavior: ButtonBarLayoutBehavior.padded,
        textTheme: ButtonTextTheme.normal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    ),

    //Home
    home: Scaffold(
      appBar: AppBar(
        title: Text("Tech News"),
        backgroundColor: Colors.brown,
      ),
      body: TechNews(),
      resizeToAvoidBottomPadding: false,
    ),
  ));
}
