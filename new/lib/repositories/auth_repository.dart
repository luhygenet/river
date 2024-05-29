import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//////// this will be data
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  final String baseUrl;

  AuthRepository(this.baseUrl);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data; // Return the entire response map
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String> signup(String fullname, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'fullname': fullname, 'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to signup');
    }
  }

  Future<void> logout() async {
    // Implement logout logic here
  }
}