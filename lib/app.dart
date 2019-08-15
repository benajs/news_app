import 'package:flutter/material.dart';
import 'package:news_app/views/home_screen.dart';
import 'package:news_app/views/login_screen.dart';
import 'package:news_app/views/theme.dart';

class TechNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech News',
      //Theme
      theme: defaultTheme,
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
