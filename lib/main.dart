import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(MaterialApp(
    
      title: 'Tech News',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tech News"),
          backgroundColor: Colors.brown,
        ),
        body: TechNews(),
      )));
}
