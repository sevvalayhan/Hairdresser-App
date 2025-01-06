class PostMedia {
  final int id;
  final MediaType mediaType;
  final String mediaUrl;

  PostMedia({
    required this.id,
    required this.mediaType,
    required this.mediaUrl,
  });

  factory PostMedia.fromJson(Map<String, dynamic> json) {
    return PostMedia(
      id: json['id'] as int,
      mediaType: MediaType.values.firstWhere(
        (e) => e.name == json['media_type'],
        orElse: () => throw ArgumentError(
          'Invalid media_type: ${json['media_type']}',
        ),
      ),
      mediaUrl: json['media_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'media_type': mediaType.name,
      'media_url': mediaUrl,
    };
  }
}
enum MediaType{image,video}
