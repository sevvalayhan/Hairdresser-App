import 'package:hairdresser_project/models/user.dart';

class Hairdresser {
  late User? user;
  late String? identityNumber;
  late String name;
  late String surname;
  late String? bio;
  //late PhoneNumber phoneNumber;   
  late String? email;
  //late Address address;           
  late String? profileImageUrl;       
  late String? identityCard;
  late int? status;
  late bool? isImproved;

  Hairdresser({
     this.user,
     this.identityNumber,
    required this.name,
    required this.surname,
     this.bio,
     this.email,
     this.profileImageUrl,
     this.identityCard,
     this.status,
     this.isImproved,
  });
 
  factory Hairdresser.fromJson(Map<String, dynamic> json) {
    return Hairdresser(
      user: User.fromJson(json['user']),
      identityNumber: json['identityNumber'],
      name: json['name'],
      surname: json['surname'],
      bio: json['bio'],
      email: json['email'],
      profileImageUrl: json['profileImage'],  
      identityCard: json['identityCard'],
      status: json['status'],
      isImproved: json['isImproved'],
    );
  }
 
  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),  
      'identityNumber': identityNumber,
      'name': name,
      'surname': surname,
      'bio': bio,
      'email': email,
      'profileImage': profileImageUrl,  
      'identityCard': identityCard,
      'status': status,
      'isImproved': isImproved,
    };
  }
}
