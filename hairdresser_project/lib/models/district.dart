class District {
  late int id;
  late String districtName;

  District({ 
    required this.districtName,
  });

  Map<String, dynamic> toJson() {
    return {
      'district_id': id,
      'districtName': districtName,
    };
  }
  District.fromJson(Map<String, dynamic> json) {
    id = json['district_id'];
    districtName = json['districtName'];
  }
}