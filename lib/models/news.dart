
class News {
  final int id;
  final String title;
  final String content;
  final String author;
  final String image;
  final String source;
  final String category;
  final String published;

  News.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        title = jsonMap['title'],
        author = jsonMap['author'],
        published = jsonMap['published'],
        content = jsonMap['content'],
        category = jsonMap['category'],
        source = jsonMap['source'],
        image = jsonMap['image'];
  //    "https://flutter.dev/assets/ui/layout/card-flutter-gallery-184963eb23d8824ef3df612a6b40205ed113e7c00da98fa22228cc6e6f619d88.png";
}
