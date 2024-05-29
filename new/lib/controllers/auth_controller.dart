import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project/repositories/auth_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthState {
  final bool isAuthenticated;
  final String? token;
  final String? userId;

  AuthState({this.isAuthenticated = false, this.token, this.userId});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(AuthState());

  Future<bool> login(String email, String password) async {
    try {
      final data = await _repository.login(email, password);
      final token = data['token'];
      final userId = data['userId'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('userId', userId);
      state = AuthState(isAuthenticated: true, token: token, userId: userId);
      return state.isAuthenticated;
    } catch (e) {
      print("failed in auth_controller: $e");
      state = AuthState(isAuthenticated: false);
      print(state);
      return state.isAuthenticated;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userId');
    state = AuthState(isAuthenticated: false);
  }

  Future<void> signUp(String fullname, String email, String password) async {
    try {
      // Perform signup using repository
      final token = await _repository.signup(fullname, email, password);
      state = AuthState(isAuthenticated: true, token: token);
    } catch (e) {
      // Handle signup error
      state = AuthState(isAuthenticated: false); // Update state if signup fails
    }
  }
}
