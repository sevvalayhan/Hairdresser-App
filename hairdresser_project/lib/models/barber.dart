import 'package:hairdresser_project/models/category.dart';
import 'package:hairdresser_project/models/user.dart';

class Barber {
   int id;
   User user;
   String identityNumber;
   String firstName;
   String lastName;
   String bio;
   String email;
   String profileImage;
   String identityCard;
   int status;
   String shopName;
   bool isImproved;
   List<Category> categories;
  Barber({
    this.id = 0,
    required this.user,
    this.identityNumber = '',
    this.firstName = '',
    this.lastName = '',
    this.bio = '',
    this.email = '',
    this.profileImage = '',
    this.identityCard = '',
    this.status = 1,
    this.shopName = '',
    this.isImproved = false,
    this.categories=const <Category>[]
  });

  factory Barber.fromJson(Map<String, dynamic> json) {
    return Barber(
      id: json['id'] ?? 0,
      user: User.fromJson(json['user'] ?? {}),
      identityNumber: json['identity_number'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      bio: json['bio'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profile_image'] ?? '',
      identityCard: json['identity_card'] ?? '',
      status: json['status'] ?? 1,
      shopName: json['shop_name'] ?? '',
      isImproved: json['is_improved'] ?? false,
      categories:json['category'] != null ? (json['category'] as List)
          .map((item) => Category.fromJson(item))
          .toList() : [],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'identity_number': identityNumber,
      'first_name': firstName,
      'last_name': lastName,
      'bio': bio,
      'email': email,
      'profile_image': profileImage,
      'identity_card': identityCard,
      'status': status,
      'shop_name': shopName,
      'is_improved': isImproved,
      'category': categories
    };
  }
}
