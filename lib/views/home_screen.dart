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
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    listenForNews();
  }

  listenForNews() async {
    print("Reading news");
    isLoading = true;
    _news = await getNews();
    isLoading = false;
    setState(() => _news);
    print("news read");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: isLoading
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
            child: Column(children: [
              ListTile(
                  title: Text(_news[index].title),
                  leading: CircleAvatar(
                    child: Image.network(_news[index].image)
                      //  "https://flutter.dev/assets/ui/layout/card-flutter-gallery-184963eb23d8824ef3df612a6b40205ed113e7c00da98fa22228cc6e6f619d88.png"),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(news: _news[index]),
                      ),
                    );
                  }),
              Divider(),
              ListTile(
                subtitle: Text('Author:${_news[index].author}'),
              )
            ]),
          );
        });
  }
}
