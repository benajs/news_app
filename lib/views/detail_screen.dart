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
    return Center(
        child: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
                child: Text(
              news.title,
              style: Theme.of(context).textTheme.title,
            )),
            Divider(),
            Container(child: Image.network(news.image)
                //   "https://flutter.dev/assets/ui/layout/card-flutter-gallery-184963eb23d8824ef3df612a6b40205ed113e7c00da98fa22228cc6e6f619d88.png"),
                ),
            Divider(),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Author: ${news.author.trim()} \nCategory: ${news.category}} \nPublished: ${news.published}',
                style: Theme.of(context).textTheme.subtitle,
              ),
            ),
            Divider(),
            Center(
              child:
                  Text(news.content, style: Theme.of(context).textTheme.body1),
            ),
            Divider(),
            Center(
              child: Text(news.source,
                  style: Theme.of(context).textTheme.subtitle),
            ),
          ]),
    ));
  }
}
