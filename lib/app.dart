import 'package:flutter/material.dart';
import 'package:news_app/views/login_screen.dart';


class TechNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Tech News',
    home: LoginPage(),
  );

}