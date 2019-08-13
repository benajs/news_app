import 'package:flutter/material.dart';
import 'package:news_app/views/home_screen.dart';
import 'package:news_app/views/login_screen.dart';

class TechNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech News',

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
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
      home: Scaffold(
        body: LoginPage(),
        resizeToAvoidBottomPadding: false, 
      ),

      //Route
      routes: {
        '/home': (context) => Home(),
        //  '/detail': (context) => DetailScreen()
      },
    );
  }
}
