class Category {
  late String key;
  late String categoryName;
  late String descriptions;
  late DateTime createdAt;
  late String imageUrl;

  Category({
    
    required this.categoryName,
    required this.descriptions,
    required this.createdAt,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryName: json['categoryName'],
      descriptions: json['descriptions'],
      createdAt: DateTime.parse(json['createdAt']),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'descriptions': descriptions,
      'createdAt': createdAt.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }
}
