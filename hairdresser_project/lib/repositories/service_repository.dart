import 'dart:convert';
import 'package:hairdresser_project/models/service.dart';
import 'package:http/http.dart' as http;

class ServiceRepository {
  final String baseUrl = '';

  
  Future<List<Service>?> fetchAllServices() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Service.fromJson(data)).toList();
      } else {
        print("Failed to load posts");
        return null;
      }
    } catch (e) {
      print("Error fetching posts: $e");
      return null;
    }
  }
  
  Future<Service?> addService(Service service) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(service.toJson()),
      );
      if (response.statusCode == 201) {
        return Service.fromJson(json.decode(response.body));
      } else {
        print("Failed to add post");
        return null;
      }
    } catch (e) {
      print("Error adding post: $e");
      return null;
    }
  }

  Future<Service?> updateService(int serviceId, Service service) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$serviceId/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(service.toJson()),
      );
      if (response.statusCode == 200) {
        return Service.fromJson(json.decode(response.body));
      } else {
        print("Failed to update post");
        return null;
      }
    } catch (e) {
      print("Error updating post: $e");
      return null;
    }
  }

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
