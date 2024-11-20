
import 'package:hairdresser_project/models/district.dart';
//province ve country burada olmasına gerek yok
class Address {
   int id;
   District district;
   int addressType;
   String buildingNo;
   String street;
   String region;
   int postalCode;
   String description;
   String coordinate;
   int userId;

  Address({
    required this.id,
    required this.district,
    required this.addressType,
    required this.buildingNo,
    required this.street,
    required this.region,
    required this.postalCode,
    required this.description,
    required this.coordinate,
    required this.userId,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      district: District.fromJson(json['district']),
      addressType: json['address_type'],
      buildingNo: json['building_no'],
      street: json['street'],
      region: json['region'],
      postalCode: json['postal_code'],
      description: json['description'],
      coordinate: json['coordinate'],
      userId: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'district': district.toJson(),
      'address_type': addressType,
      'building_no': buildingNo,
      'street': street,
      'region': region,
      'postal_code': postalCode,
      'description': description,
      'coordinate': coordinate,
      'user': userId,
    };
  }
}