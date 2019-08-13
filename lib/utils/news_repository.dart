import 'dart:convert';
import 'package:news_app/models/news.dart';
import 'package:news_app/utils/network_util.dart';

NetworkUtil _netUtil = new NetworkUtil();

Future<List> getNews() async {
  var path = "news";

  final streamedRest = await _netUtil.dioGet(path);

  print(streamedRest.toString());

  Iterable list = json.decode(streamedRest.body);
  var news = list.map((model) => News.fromJSON(model)).toList();
  return news;
}
