class News {
  final int id;
  final String title;
  final String published;
  final String author;
  final String image;

  News.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        title = jsonMap['title'],
        author = jsonMap['author'],
        published = jsonMap['published'],
        image = jsonMap['image'];
}
