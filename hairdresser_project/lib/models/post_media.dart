import 'package:hairdresser_project/models/post.dart';

class PostMedia {
  late String mediaUrl;
  late MediaType mediaType;

  PostMedia({
    required this.mediaUrl,
    required this.mediaType,
  });

  factory PostMedia.fromJson(Map<String, dynamic> json) {
    return PostMedia(
      mediaUrl: json['mediaUrl'],
      mediaType: MediaType.values[json['mediaType']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mediaUrl': mediaUrl,
      'mediaType': mediaType.index,  // Store the index of the enum
    };
  }
}
