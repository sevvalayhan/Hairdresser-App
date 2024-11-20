
class ServiceImage {
  final int id;
  final String image;
  

  ServiceImage({
    required this.id,
    required this.image, 
  });

  factory ServiceImage.fromJson(Map<String, dynamic> json) {
    return ServiceImage(
      id: json['id'],
      image: json['image'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image, 
    };
  }
}