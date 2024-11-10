import 'package:hairdresser_project/models/district.dart';

class Province {
  late int id;
  late District district;
  late String provinceName;

  Province({required this.provinceName,required this.district});

  Map<String, dynamic> toJson() {
    return {
      'provinceName': provinceName,
      'province_id': id,
      'district':district.toJson()
    };
  }

  Province.fromJson(Map<String, dynamic> json) {
    provinceName = json['provinceName'];
    id = json['province_id'];
    district = District.fromJson(json['district']);
  }
}
