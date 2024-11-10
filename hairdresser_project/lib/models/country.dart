import 'package:hairdresser_project/models/province.dart';
class Country {
  late int id;
  late int countryCode;
  late String countryName;
  late Province province;

  Country({ 
    required this.countryCode,
    required this.countryName,
    required this.province
  });

  Map<String, dynamic> toJson() {
    return {
      'country_id': id,
      'countryCode': countryCode,
      'countryName': countryName,
      'province':province.toJson()
    };
  }

  Country.fromJson(Map<String, dynamic> json) {
    id = json['country_id'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    province =  json['province'];
  }
}