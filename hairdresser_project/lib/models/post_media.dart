import 'package:hairdresser_project/models/post.dart';

class PostMedia {
  int id;
  String mediaUrl;
  MediaType mediaType;

  PostMedia({
    required this.id,
    required this.mediaUrl,
    required this.mediaType,
  });

  factory PostMedia.fromJson(Map<String, dynamic> json) {
    return PostMedia(
      id: json['id'],
      mediaUrl: json['media_url'],
      mediaType: MediaType.values[json['media_type']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'media_url': mediaUrl,
      'media_type': mediaType.index,
    };
  }
}
