import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hairdresser_project/models/post.dart';

class PostRepository {
  final String baseUrl = 'http://127.0.0.1:8000/barber/';

  Future<List<Post>?> fetchAllPosts() async {
    final url = Uri.parse('${baseUrl}get-post');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            jsonDecode(utf8.decode(response.bodyBytes));
           
        return jsonData.map((post) => Post.fromJson(post)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) { 
      throw Exception('Error fetching posts: $error');
    }
  }

  Future<Post?> addPost(Post post) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(post.toJson()),
      );
      if (response.statusCode == 201) {
        return Post.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Post?> updatePost(int postId, Post post) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$postId/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(post.toJson()),
      );
      if (response.statusCode == 200) {
        return Post.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> deletePost(int postId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$postId/'));
      if (response.statusCode == 204) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
