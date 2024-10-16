import 'package:hairdresser_project/models/hairdresser.dart';

class Post {
  late int? id;
  late Hairdresser hairdresser;
  final String content;
  final String categoryName;
  String? videoUrl;
  List<String>? postImageUrlList;
  late DateTime? createdAt;
  late DateTime? updatedAt;

  Post({
    required this.hairdresser,
    required this.categoryName,
    this.id,
    required this.content,
    this.videoUrl,
    this.postImageUrlList,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      hairdresser: Hairdresser.fromJson(json['hairdresser']),
      content: json['content'],
      categoryName: json['categoryName'],
      videoUrl: json['videoUrl'],
      postImageUrlList: json['postImage'],
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
      'videoUrl': videoUrl,
      'postImage': postImageUrlList,
      'createdAt': createdAt!.toIso8601String(),
      'updatedAt': updatedAt!.toIso8601String(),
    };
  }
}
