import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/models/category.dart';
import 'package:hairdresser_project/models/post_media.dart';

class Post {
  int id;
  Barber barber;
  String content;
  Category category;
  DateTime createdAt;
  DateTime updatedAt;
  List<PostMedia> postMediaList;

  Post({
    required this.id,
    this.postMediaList = const <PostMedia>[],
    required this.barber,
    required this.category,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      postMediaList: (json['post_media'] as List)
          .map((item) => PostMedia.fromJson(item))
          .toList(),
      barber: Barber.fromJson(json['barber']),
      category: json['category'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hairdresser': barber.toJson(),
      'content': content,
      'category': category,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'post_media': postMediaList?.map((media) => media.toJson()).toList(),
    };
  }
}

enum MediaType { video, image }
