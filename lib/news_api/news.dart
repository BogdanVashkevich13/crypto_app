class News {
  final String name;
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const News({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  News.fromJson(Map<String, dynamic> json):
      name = json['name'],
        author = json['author'],
        title = json['title'],
        description = json['description'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'];
}