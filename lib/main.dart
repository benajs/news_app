import 'package:flutter/material.dart';
import 'package:news_app/views/drawer.dart';
import 'package:news_app/views/home_screen.dart';
import 'package:news_app/views/theme.dart';

import 'app.dart';

void main() {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var isProfile = false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //Theme
    theme: defaultTheme,
    //Home
    home: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Trending"),
        leading: CircleAvatar(
          child: Image(image: AssetImage('assets/logo.png')),
        ),
      ),
      body: TechNews(),
      drawer: new SearchDrawer(),
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          switch (index) {
            case 0:
              _scaffoldKey.currentState.openDrawer();
              break;
            case 1:
              Navigator.of(_scaffoldKey.currentContext).pushNamed('/home');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("Profile"),
            activeIcon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          )
          // IconButton(
          //     icon: Icon(Icons.search),
          //     tooltip: "Search",
          //     onPressed: () {
          //       _scaffoldKey.currentState.showSnackBar(new SnackBar(
          //         content: Text("Search"),
          //       ));
          //     }),
          // IconButton(
          //     icon: Icon(Icons.favorite_border),
          //     tooltip: "Favourite",
          //     onPressed: () {
          //       // TODO Show Drawer
          //     }),
          // IconButton(
          //     icon: Icon(Icons.share),
          //     tooltip: "Share",
          //     onPressed: () {
          //       // TODO Show Drawer
          //     }),
        ],
      ),
      resizeToAvoidBottomInset: false,
    ),
    //Route
    routes: {
      '/home': (context) => Home(),
      //  '/detail': (context) => DetailScreen()
    },
  ));
}
