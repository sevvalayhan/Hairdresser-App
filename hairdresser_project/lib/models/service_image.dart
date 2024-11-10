
class ServiceImage {  
  final String imageUrl;

  ServiceImage({required this.imageUrl});

  factory ServiceImage.fromJson(Map<String, dynamic> json) {
    return ServiceImage(
      
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
    };
  }
}
