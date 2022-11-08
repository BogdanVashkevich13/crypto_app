class Facts {
  final String title;
  final String description;
  final String urlToImage;
  final String content;

  const Facts({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.content,
  });

  Facts.fromJson(Map<String, dynamic> json):
        title = json['title'],
        description = json['description'],
        urlToImage = json['urlToImage'],
        content = json['content'];
}