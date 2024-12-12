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
  //Status status
  final bool isImproved;

  Barber({
    required this.id,
    required this.user,
    required this.identityNumber,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.email,
    required this.profileImage,
    required this.identityCard,
    required this.status,
    required this.shopName,
    required this.isImproved,
  });

  factory Barber.fromJson(Map<String, dynamic> json) {
    return Barber(
      id: json['id'],
      user: User.fromJson(json['user']),
      identityNumber: json['identity_number'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      bio: json['bio'],
      email: json['email'],
      profileImage: json['profile_image'],
      identityCard: json['identity_card'],
      status: json['status'],
      shopName: json['shop_name'],
      isImproved: json['is_improved'],
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
      'is_improved': isImproved,
    };
  }
}

enum Status {
  normal,
  advanced,
}
