
import 'package:hairdresser_project/models/address.dart';

class User {
  final int id;
  final String email;
  final String phoneNumber;
  final List<Address> addresses;

  User({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.addresses,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      addresses: (json['addresses'] as List)
          .map((address) => Address.fromJson(address))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone_number': phoneNumber,
      'addresses': addresses.map((address) => address.toJson()).toList(),
    };
  }
}
