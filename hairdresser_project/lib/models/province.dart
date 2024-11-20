 

import 'package:hairdresser_project/models/country.dart';

class Province {
  int id;
  Country country;
  String provinceName;

  Province(
      {required this.id, required this.provinceName, required this.country});

  Map<String, dynamic> toJson() {
    return {
      'province_name': provinceName,      
      'country': country.toJson(),
      'id': id,
    };
  }

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
        id: json['id'],
        country: Country.fromJson(json['country']) ,               
        provinceName: json['province_name'],);
  }
}
