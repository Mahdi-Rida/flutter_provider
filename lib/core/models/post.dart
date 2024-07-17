class Post {
  int userId;
  int id;
  String title;
  String body;
  int likes;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.likes,
  });

  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        likes = 0,
        body = json['body'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['likes'] = this.likes;
    data['body'] = this.body;
    return data;
  }
}
