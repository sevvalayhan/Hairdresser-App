import 'dart:convert';
import 'package:hairdresser_project/models/service.dart';
import 'package:http/http.dart' as http;

class ServiceRepository {
  final String baseUrl = 'http://127.0.0.1:8000/barber/get-service';

  Future<List<Service>> fetchAllServices() async {
    print("-------------------");
    try {
  final response = await http.get(Uri.parse("${baseUrl}"));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body); // veya kendi işlem yapınıza göre kullanın
    print(data);
  } else {
    print("Başarısız istek: ${response.statusCode}");
  }
} catch (e) {
  print("Hata: $e");
}


    final response = await http.get(Uri.parse("${baseUrl}get-service"));
    print(response);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var fetchedServiceData =
          jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      List<Service> fechedServices =
          fetchedServiceData.map((s) => Service.fromJson(s)).toList();
      return fechedServices;
    } else {
      throw Exception((e) => "Failed to fetch services: ${e}");
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
