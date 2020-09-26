import 'dart:convert';

class User{
  int id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  User({this.id, this.email, this.first_name, this.last_name, this.avatar});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
      "avatar": avatar
    };
  }

  User.fromMap(Map<String, dynamic> source) {
    id = source["id"];
    email = source["email"];
    first_name = source["first_name"];
    last_name = source["last_name"];
    avatar = source["avatar"];
  }

  User.fromJson(String source)
      : this.fromMap(Map<String, dynamic>.from(jsonDecode(source)));

  @override
  String toString() {
    return this.toMap().toString();
  }
}