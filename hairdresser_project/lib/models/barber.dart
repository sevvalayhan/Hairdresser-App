import 'package:hairdresser_project/models/user.dart';

class Barber {
  late User user;
  late String barberName;
  late String barberSurname;
  late String bio;
  late String email;
  late String profileImageUrl;
  late String identityCard;
  late Status status;
  late bool isImproved;

  Barber({
    required this.user,
    required this.barberName,
    required this.barberSurname,
    required this.bio,
    required this.email,
    required this.profileImageUrl,
    required this.identityCard,
    this.status = Status.normal,
    this.isImproved = false,
  });

  factory Barber.fromJson(Map<String, dynamic> json) {
    return Barber(
      user: User.fromJson(json['user']),
      barberName: json['barberName'],
      barberSurname: json['barberSurname'],
      bio: json['bio'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
      identityCard: json['identityCard'],
      status: Status.values[json['status']],
      isImproved: json['isImproved'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'barberName': barberName,
      'barberSurname': barberSurname,
      'bio': bio,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'identityCard': identityCard,
      'status': status.index,
      'isImproved': isImproved,
    };
  }
}

enum Status {
  normal,
  advanced,
}
