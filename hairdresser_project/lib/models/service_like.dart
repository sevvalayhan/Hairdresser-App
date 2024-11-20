
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/models/user.dart';

class ServiceLike {
  int id;
  User user;
  Service service;
  DateTime likedAt;

  ServiceLike({
    required this.id,
    required this.likedAt,
    required this.user,
    required this.service,
  });

  factory ServiceLike.fromJson(Map<String, dynamic> json) {
    return ServiceLike(
      id: json['id'],
      user: User.fromJson(json['user']),
      service: Service.fromJson(json['service']),
      likedAt: json['liked_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'liked_at': likedAt,
      'service': service.toJson(),
      'user': user.toJson()
    };
  }
}
