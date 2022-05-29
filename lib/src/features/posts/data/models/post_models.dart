import '../../domain/entities/posts.dart';

//PostModel extends Post entity (in domain layer)
// to make json functions

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.title,
    required super.body,
  });

//factory keyword :
//allows me to use return inside the constructor

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json["id"], title: json["title"], body: json["body"]);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
