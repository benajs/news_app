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
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          title: Text(news.title),
          subtitle: Text('Author:${news.content}'),
        ),
        Divider(),
        Center(
          child: Image.network(
              "https://flutter.dev/assets/ui/layout/card-flutter-gallery-184963eb23d8824ef3df612a6b40205ed113e7c00da98fa22228cc6e6f619d88.png"),
        ),
        Divider(),
        Center(
          child: Text(news.content),
        )
      ]),
    );
  }
}
