class User {
  int id;
  String title;
  String body;

  User({required this.id, required this.title, required this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'body': body};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}
