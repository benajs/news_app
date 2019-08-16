import 'package:flutter/material.dart';

class SearchDrawer extends StatefulWidget {
  SearchDrawer({Key key}) : super(key: key);

  _SearchDrawerState createState() => _SearchDrawerState();
}

class _SearchDrawerState extends State<SearchDrawer> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      elevation: 2.0,
      child: ListView(
        children: <Widget>[
          new DrawerHeader(
            child: Text(
              "Search News",
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          
          RaisedButton(
            child: Text("Log In"),
            onPressed: () {
              //TODO Search action
            },
          )
        ],
      ),
    );
  }
}
