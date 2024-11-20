
class Country {
  final int id;
  final int countryCode;
  final String countryName;

  Country({
    required this.id,
    required this.countryCode,
    required this.countryName,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      countryCode: json['country_code'],
      countryName: json['country_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country_code': countryCode,
      'country_name': countryName,
    };
  }
}