import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/utils/news_repository.dart';
import 'package:news_app/views/detail_screen.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<News> _news = <News>[];

  @override
  void initState() {
    super.initState();
    listenForPosts();
  }

  void listenForPosts() async {
    final Stream<News> stream = await getNews();
    stream.listen((News news) => setState(() => _news.add(news)));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tech news'),
        ),
        body: ListView.builder(
            itemCount: _news.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    title: Text(_news[index].title),
                    subtitle: Text('Author:${_news[index].author}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(news: _news[index]),
                        ),
                      );
                    }),
              );
            }),
      );
}
