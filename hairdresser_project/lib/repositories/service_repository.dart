import 'dart:convert';
import 'package:hairdresser_project/models/service.dart';
import 'package:http/http.dart' as http;

class ServiceRepository {
  final String baseUrl = 'http://127.0.0.1:8000/barber/';

  Future<List<Service>?> fetchAllServices() async {
    final url = Uri.parse('${baseUrl}get-service'); // API endpoint
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            jsonDecode((utf8.decode(response.bodyBytes)));
        return jsonData.map((service) => Service.fromJson(service)).toList();
      } else {
        throw Exception('Failed to load services');
      }
    } catch (error) {
      throw Exception('Error fetching services: $error');
    }
  }

  // Future<Service?> addService(Service service) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(baseUrl),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: json.encode(service.toJson()),
  //     );
  //     if (response.statusCode == 201) {
  //       return Service.fromJson(json.decode(response.body));
  //     } else {
  //       print("Failed to add post");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Error adding post: $e");
  //     return null;
  //   }
  // }

  // Future<Service?> updateService(int serviceId, Service service) async {
  //   try {
  //     final response = await http.put(
  //       Uri.parse('$baseUrl/$serviceId/'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: json.encode(service.toJson()),
  //     );
  //     if (response.statusCode == 200) {
  //       return Service.fromJson(json.decode(response.body));
  //     } else {
  //       print("Failed to update post");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Error updating post: $e");
  //     return null;
  //   }
  // }

  Future<bool> deleteService(int serviceId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$serviceId/'));
      if (response.statusCode == 204) {
        return true;
      } else {
        print("Failed to delete post");
        return false;
      }
    } catch (e) {
      print("Error deleting post: $e");
      return false;
    }
  }
}
