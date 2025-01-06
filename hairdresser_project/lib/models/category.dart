class Category {
  int id;
  String categoryName;
  String description;
  String createdAt;
  String categoryImage;

  Category({
    required this.id,
    required this.categoryName,
    this.description = "",
    required this.createdAt,
    required this.categoryImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryName: json['category_name'],
      description: json['description'],
      createdAt: json['created_at'],
      categoryImage: json['category_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_name': categoryName,
      'description': description,
      'created_at': createdAt,
      'category_image': categoryImage,
    };
  }
}
