class News {
  //final String name;
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const News({
    //required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      author: map['author'] != null ? map['author'] as String : "No Author",
      title: map['title'] != null ? map['title'] as String : "No Title",
      description: map['description'] != null
          ? map['description'] as String
          : "No Description",
      urlToImage: map['urlToImage'] != null
          ? map['urlToImage'] as String
          : "https://images.unsplash.com/photo-1665931500523-98ae696c47f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      publishedAt: map['publishedAt'] != null
          ? map['publishedAt'] as String
          : "No Data",
      content:
      map['content'] != null ? map['content'] as String : "No Content",
    );
  }
}
// News( this.author, this.title, this.description,
//     this.urlToImage, this.publishedAt, this.content);
//
// factory News.fromJson(Map<String, dynamic> json) =>
//     _$NewsFromJson(json);
// Map<String, dynamic> toJson() => _$NewsToJson(this);


// factory News.fromMap(Map<String, dynamic> map) {
// return News(
// author: map['author'] != null ? map['author'] as String : "Author null",
// title: map['title'] != null ? map['title'] as String : "title Null",
// description: map['description'] != null
// ? map['description'] as String
//     : "description Null",
// urlToImage: map['urlToImage'] != null
// ? map['urlToImage'] as String
//     : "https://images.unsplash.com/photo-1665931500523-98ae696c47f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
// publishedAt: map['publishedAt'] != null
// ? map['publishedAt'] as String
//     : "publishedAt Null",
// content:
// map['content'] != null ? map['content'] as String : "content Null",
// );


// News.fromJson(Map<String, dynamic> json):
// name = json['name'],
// author = json['author'] != null ? map['author'] as String : 'No Author',
// title = json['title'],
// description = json['description'],
// urlToImage = json['urlToImage'],
// publishedAt = json['publishedAt'],
