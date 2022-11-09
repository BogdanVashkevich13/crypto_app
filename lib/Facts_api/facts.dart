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
  factory Facts.fromMap(Map<String, dynamic> map) {
    return Facts(
      title: map['title'] != null ? map['title'] as String : "No Title",
      description: map['description'] != null
          ? map['description'] as String
          : "No Description",
      urlToImage: map['urlToImage'] != null
          ? map['urlToImage'] as String
          : "https://images.unsplash.com/photo-1665931500523-98ae696c47f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      content:
      map['content'] != null ? map['content'] as String : "No Content",
    );
  }
}