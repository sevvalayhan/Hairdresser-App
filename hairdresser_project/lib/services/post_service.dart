import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hairdresser_project/models/post.dart';

class PostService {
  final String baseUrl = '';

  
  Future<List<Post>?> fetchAllPosts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Post.fromJson(data)).toList();
      } else {
        print("Failed to load posts");
        return null;
      }
    } catch (e) {
      print("Error fetching posts: $e");
      return null;
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
        print("Failed to add post");
        return null;
      }
    } catch (e) {
      print("Error adding post: $e");
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
        print("Failed to update post");
        return null;
      }
    } catch (e) {
      print("Error updating post: $e");
      return null;
    }
  }

  Future<bool> deletePost(int postId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$postId/'));
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
