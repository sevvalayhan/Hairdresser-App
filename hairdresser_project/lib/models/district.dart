import 'package:hairdresser_project/models/province.dart';

class District {
  int id;
  String districtName;
  Province province;

  District({
    required this.id,
    required this.districtName,
    required this.province,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'district_name': districtName,
      'province':province.toJson()
    };
  }

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
        id: json['id'],
        districtName: json['district_name'],
        province: Province.fromJson(json['province']));
  }
}
