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
              children: [
                ListTile(
                  title: Text(_news[index].title),
                  leading: Icon(Icons.add_circle),
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
                      subtitle: Text('Author:${_news[index].content}'),

                  )
              ]
            ),
          );
        });
  }


}
