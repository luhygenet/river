import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project/repositories/item_repository.dart';
import 'package:flutter_project/controllers/item_controller.dart';

final itemRepositoryProvider = Provider<ItemRepository>((ref) {
  // Initialize the ItemRepository with the base URL of your backend
  return ItemRepository('http://localhost:3000'); // Update with your actual base URL
});

final itemStateProvider = StateNotifierProvider<ItemNotifier, List<Map<String, dynamic>>>((ref) {
  final repository = ref.watch(itemRepositoryProvider);
  return ItemNotifier(repository);
});