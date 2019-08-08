import 'package:flutter/material.dart';
import 'package:news_app/views/home_screen.dart';
import 'package:news_app/views/login_screen.dart';

class TechNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Tech News',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.brown,
          accentColor: Colors.orangeAccent,
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
              headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind')),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.orange,
            layoutBehavior: ButtonBarLayoutBehavior.padded,
            textTheme: ButtonTextTheme.normal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Tech News"),
            backgroundColor: Colors.brown,
          ),
          body: LoginPage(),
          bottomNavigationBar: BottomAppBar(
            child: Container(
                child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    final sn = SnackBar(content: Text("Welcome to Tech News"));
                    Scaffold.of(context).showSnackBar(sn);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

              ],
            )),
          ),
        ),
        routes: {
          '/home': (context) => Home(),
          //  '/detail': (context) => DetailScreen()
        },
      );
}
