import 'package:flutter/material.dart';
import 'package:news_app/views/drawer.dart';
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
      appBar: AppBar(title: Text("Tech News")),
      body: TechNews(),
      drawer: new SearchDrawer(),
      resizeToAvoidBottomPadding: false,
      persistentFooterButtons: <Widget>[
        IconButton(
            icon: isProfile ? Icon(Icons.person_outline) : Icon(Icons.person),
            tooltip: "Profile",
            onPressed: () {
              isProfile = !isProfile;
              _scaffoldKey.currentState.openDrawer();
            }),
        IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: () {
              _scaffoldKey.currentState.showSnackBar(new SnackBar(
                content: Text("Search"),
              ));
            }),
        IconButton(
            icon: Icon(Icons.favorite_border),
            tooltip: "Favourite",
            onPressed: () {
              // TODO Show Drawer
            }),
        IconButton(
            icon: Icon(Icons.home),
            tooltip: "Home",
            onPressed: () {
              // TODO Show Drawer
            }),
        IconButton(
            icon: Icon(Icons.share),
            tooltip: "Share",
            onPressed: () {
              // TODO Show Drawer
            }),
      ],
    ),
  ));
}
