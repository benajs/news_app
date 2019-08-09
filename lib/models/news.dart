
class News {
  final int id;
  final String title;
  final String content;
  final String author;
  final String image;

  News.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        title = jsonMap['title'],
        author = jsonMap['author'],
        content = jsonMap['content'],
        image = jsonMap['image'];
}
