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
  var is_loading = false;

  @override
  void initState() {
    super.initState();
    listenForNews();
  }

  listenForNews() async {
    print("Reading news");
    is_loading = true;
    _news = await getNews();
    is_loading = false;
    setState(() => _news);
    print("news read");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: is_loading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.brown),
                ),
              )
            : getListView(context));
  }

  Widget getListView(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _news?.length,
        itemBuilder: (context, index) {
          return new Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                ListTile(
                    leading: Container(child: Image.network(_news[index].image)),
                    title: Text(
                      _news[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text('Author:${_news[index].author.trim()}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(news: _news[index]),
                        ),
                      );
                    }),
              ]));
        });
  }

  Widget getGridView(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _news?.length,
        itemBuilder: (context, index) {
          return new Card(
            child: Column(children: [
              GridTileBar(
                title: Text(_news[index].title),
                leading: CircleAvatar(child: Image.network(_news[index].image)
                    //  "https://flutter.dev/assets/ui/layout/card-flutter-gallery-184963eb23d8824ef3df612a6b40205ed113e7c00da98fa22228cc6e6f619d88.png"),
                    ),
              ),
              Divider(),
              ListTile(
                subtitle: Text('Author:${_news[index].author}'),
              )
            ]),
          );
        });
  }
}
