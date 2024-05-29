import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemRepository {
  final String baseUrl;

  ItemRepository(this.baseUrl);

  Future<List<Map<String, dynamic>>> getAllItems() async {
    final response = await http.get(Uri.parse('$baseUrl/items'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<Map<String, dynamic>> createItem(Map<String, dynamic> itemData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/items'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(itemData),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<Map<String, dynamic>> updateItem(String id, Map<String, dynamic> updateData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/items/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updateData),
    );
    if (response.statusCode == 200  || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update item');
    }
  }

  Future<void> deleteItem(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/items/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete item');
    }
  }
}