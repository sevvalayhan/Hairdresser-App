import 'package:hairdresser_project/models/country.dart';

class Address {
  late int id;
  late int addressType;
  late String buildingNo;
  late String street;
  late String region;
  late int postalCode;
  // late District district;
  // late Province province;
   late Country country;
  late String description;
  late String coordinate;

  // Constructor
  Address({
    
    required this.addressType,
    required this.buildingNo,
    required this.street,
    required this.region,
    required this.postalCode,
    // required this.district,
    // required this.province,
    required this.country,
    required this.description,
    required this.coordinate,
  });

  // toJson Method
  Map<String, dynamic> toJson() {
    return {
      'address_id':id,
      'addressType': addressType,
      'buildingNo': buildingNo,
      'street': street,
      'region': region,
      'postalCode': postalCode,
      // 'district': district.toJson(),
      // 'province': province.toJson(),
       'country': country.toJson(),
      'description': description,
      'coordinate': coordinate,
    };
  }

  // fromJson Method
  Address.fromJson(Map<String, dynamic> json) {
    id = json['address_id'];
    addressType = json['addressType'];
    buildingNo = json['buildingNo'];
    street = json['street'];
    region = json['region'];
    postalCode = json['postalCode'];
    // district = District.fromJson(json['district']);
    // province = Province.fromJson(json['province']);
     country = Country.fromJson(json['country']);
    description = json['description'];
    coordinate = json['coordinate'];
  }
}
