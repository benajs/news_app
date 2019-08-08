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
  var load_state = false;

  @override
  void initState() {
    super.initState();
    listenForNews();
  }

  listenForNews() async {
    print("Reading news");
    load_state = true;
    _news = await getNews();
    load_state = false;
    setState(() => _news);
    print("news read");
  }

  Widget makeBody(BuildContext context) => RefreshIndicator(
        child: Container(
          color: Colors.black87,
          child: makeGridView(context),
        ),
        onRefresh: listenForNews(),
      );

  Widget makeGridView(BuildContext context) => Container(
        padding: EdgeInsets.only(bottom: 4.0, right: 2.0, left: 2.0),
        child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 4.0,
            ),
            itemCount: _news?.length,
            itemBuilder: (BuildContext context, int position) =>
                getNewsRow(news: _news[position])),
      );
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: load_state
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.brown),
                ),
              )
            : getListView(context)
        //  ListView.builder(
        //     itemCount: _news?.length,
        //     itemBuilder: (context, index) {
        //       return get(news: _news[index]);
        //     })
        );
  }

  Widget getListView(BuildContext context) {
    return ListView.builder(
        itemCount: _news?.length,
        itemBuilder: (context, index) {
          return new Card(
              child: Container(
                  child: ListTile(
                      title: Text(_news[index].title),
                      subtitle: Text('Author:${_news[index].content}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(news: _news[index]),
                          ),
                        );
                      }),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.7],
                      colors: [
                        Colors.white,
                        Colors.orangeAccent,
                      ],
                    ),
                  )));
        });
  }

  getNewsRow({News news}) {
    print(news);
    CircleAvatar channelLogo(var url) {
      try {
        return new CircleAvatar(
          child: new Icon(Icons.library_books),
        );
      } catch (Exception) {
        return new CircleAvatar(
          child: new Icon(Icons.library_books),
        );
      }
    }

    final newsCard = Container(
        child: GridTile(
            child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: new Container(
              child: channelLogo(news.id),
              width: 130.0,
              height: 130.0,
              padding: const EdgeInsets.all(3.0),
              // border width
              decoration: new BoxDecoration(
                color: Colors.teal, // border color
                shape: BoxShape.circle,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 4.0, left: 4.0),
          child: Text(
            news.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    )));
    return new Container(
      child: GestureDetector(
        onTap: () {
          if (news.id.toString().isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                        news: news,
                      )),
            );
          }
        },
        child: newsCard,
      ),
    );
  }
}
