import 'dart:convert';
import 'package:news_app/models/news.dart';
import 'package:news_app/utils/network_util.dart';

NetworkUtil _netUtil = new NetworkUtil();

Future<Stream<News>> getNews() async {
  var path = "news";

  final streamedRest = await _netUtil.get(path);
  print(streamedRest.statusCode);

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => News.fromJSON(data));
}
