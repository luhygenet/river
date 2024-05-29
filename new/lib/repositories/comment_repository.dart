import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentRepository {
  final String baseUrl;

  CommentRepository(this.baseUrl);

  Future<Map<String, dynamic>> createComment(Map<String, dynamic> commentData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/comments'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(commentData),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create comment');
    }
  }

  Future<List<Map<String, dynamic>>> getAllComments() async {
    final response = await http.get(Uri.parse('$baseUrl/comments'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load comments');
    }
  }

  Future<Map<String, dynamic>> updateComment(String id, Map<String, dynamic> updateData) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/comments/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updateData),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update comment');
    }
  }

  Future<void> deleteComment(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/comments/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete comment');
    }
  }
}