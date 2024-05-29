import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project/repositories/auth_repository.dart';
import "package:flutter_project/controllers/auth_controller.dart";

// Provider for the authentication repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // Initialize the authentication repository
  return AuthRepository("http://localhost:3005");
});

// Provider for the authentication state
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(AuthRepository(
      "http://localhost:3005")), // Pass the repository instance here
);
