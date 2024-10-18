import 'package:hairdresser_project/models/hairdresser.dart';
import 'package:hairdresser_project/models/post_media.dart';


class Post {
  late int? id;
  final Hairdresser hairdresser;
  final String content;
  final String categoryName;
  late DateTime? createdAt;
  late DateTime? updatedAt;
  late List<PostMedia>? postMediaList;

  Post(
     {this.postMediaList,
    required this.hairdresser,
    required this.categoryName,
    this.id,
    required this.content,
    this.createdAt,
    this.updatedAt,
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
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hairdresser': hairdresser.toJson(),
      'content': content,
      'categoryName': categoryName,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'postMedia': postMediaList,
    };
  }
}

enum MediaType { image, video }