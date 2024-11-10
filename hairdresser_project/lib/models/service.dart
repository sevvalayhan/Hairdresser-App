import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/models/category.dart';
import 'package:hairdresser_project/models/service_image.dart';

class Service {
  late int id;
  
  late String serviceTitle;
  late Barber barber;
  late Category category;
  late String description;
  late double price;
  late DateTime duration;
  late ServiceImage serviceImage;

  Service(
      {required this.barber,
      required this.id,
      required this.category,
      required this.description,
      required this.price,
      required this.duration,
      required this.serviceTitle,required this.serviceImage});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id:json['service_id'],
      barber: Barber.fromJson(json['barber']),
      category: Category.fromJson(json['category']),
      description: json['description'],
      price: json['price'],
      duration: DateTime.parse(json['duration']),
      serviceTitle: json['service_title'], serviceImage: ServiceImage.fromJson(json['service_image']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service_id':id,
      'barber': barber.toJson(),
      'category': category.toJson(),
      'description': description,
      'price': price,
      'duration': duration.toIso8601String(),
      'service_title':serviceTitle,
      'service_image':serviceImage.toJson()
    };
  }
}
