import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(MaterialApp(
    title: 'Tech News',
    theme: ThemeData(
      appBarTheme: ThemeData.light().appBarTheme,
    ),
    home: TechNews(),
  ));
}
