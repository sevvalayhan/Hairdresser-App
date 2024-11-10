import 'package:hairdresser_project/models/hairdresser.dart';
import 'package:hairdresser_project/models/post_media.dart';

class Post {
  final int id;
  final Hairdresser hairdresser;
  final String content;
  final String categoryName;
  final DateTime createdAt;
  final DateTime updatedAt;
  List<PostMedia>? postMediaList;

  Post({
    required this.id,
    this.postMediaList,
    required this.hairdresser,
    required this.categoryName,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });


  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      postMediaList: json['postMediaList'] != null
          ? (json['postMediaList'] as List)
              .map((item) => PostMedia.fromJson(item))
              .toList()
          : null,
      hairdresser: Hairdresser.fromJson(json['hairdresser']),
      categoryName: json['categoryName'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hairdresser': hairdresser.toJson(),
      'content': content,
      'categoryName': categoryName,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'postMediaList': postMediaList?.map((media) => media.toJson()).toList(),
    };
  }
}
enum MediaType {video,image}