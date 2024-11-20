import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/models/category.dart';
import 'package:hairdresser_project/models/service_image.dart';

class Service {
  final int id;
  final Barber barber;
  final Category category;
  final List<ServiceImage> serviceImages;
  final String title;
  final String description;
  final int duration;
  final double price;

  Service({
    required this.barber,
    required this.id,
    required this.description,
    required this.price,
    required this.duration,
    required this.title,
    required this.serviceImages,
    required this.category,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    List<ServiceImage> veri = (json['service_images'] as List)
        .map((image) => ServiceImage(id: image['id'], image: image['image']))
        .toList();
    return Service(
      id: json['id'],
      barber: Barber.fromJson(json['barber']),
      category: Category.fromJson(json['category']),
      description: json['description'],
      price: json['price'],
      duration: json['duration'],
      title: json['title'],
      serviceImages: veri,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'barber': barber.toJson(),
      'category': category.toJson(),
      'description': description,
      'price': price,
      'duration': duration,
      'title': title,
      'service_images': serviceImages.map((image) => image.toJson()).toList()
    };
  }
}
