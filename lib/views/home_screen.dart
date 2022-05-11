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
    isLoading = true;
    _news = await getNews();
    isLoading = false;
    setState(() => _news);
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                ListTile(
                    leading: Container(
                        child: Image.network(
                      _news[index].image,
                      fit: BoxFit.cover,
                    )),
                    title: Text(
                      _news[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                        'Category:${_news[index].category}\nAuthor:${_news[index].author}\nPublished:${_news[index].published}'),
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
}