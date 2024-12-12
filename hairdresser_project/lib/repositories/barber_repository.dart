import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hairdresser_project/models/barber.dart';

class BarberRepository {
  final String baseUrl = "http://127.0.0.1:8000/barber/";
  Future<List<Barber>> fetchAllBarbers() async {
    final url = Uri.parse('${baseUrl}get-barber');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            jsonDecode((utf8.decode(response.bodyBytes)));
        return jsonData.map((barber) => Barber.fromJson(barber)).toList();
      } else {
        throw Exception('Failed to load barbers');
      }
    } catch (error) {
      throw Exception('Error fetching barbers: $error');
    }
  }
  Future<List<Barber>> fetchSearchBarbers(String searchText) async {
   final url = Uri.parse('${baseUrl}get-barber');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'search': searchText}),
      ); 
      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            jsonDecode((utf8.decode(response.bodyBytes)));
        return jsonData.map((barber) => Barber.fromJson(barber)).toList();
      } else {
        throw Exception('Failed to load search barbers');
      }
    } catch (error) {
      throw Exception('Error fetching search barber: $error');
    }
  }
}
