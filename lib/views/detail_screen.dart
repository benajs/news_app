import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final News news;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(news.content),
      ),
    );
  }
}
