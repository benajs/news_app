import 'package:flutter/material.dart';
import 'package:news_app/utils/network_util.dart';

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
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          accountEmail: Text("Benajs@gmail.com"),
          accountName: Text("Bena Js"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            child: Text("BJ".substring(0, 2).toUpperCase()),
          ),
        ),
        Container(
            child: Column(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.subhead,
                ),
                onTap: () {
//TODO Settings
                }),
            ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text(
                  "Log Out",
                  style: Theme.of(context).textTheme.subhead,
                ),
                onTap: () {

                }),
          ],
        ))
      ]),
    );
  }
}
