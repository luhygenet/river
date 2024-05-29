import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project/repositories/comment_repository.dart';
import 'package:flutter_project/controllers/comment_controller.dart';

final commentRepositoryProvider = Provider<CommentRepository>((ref) {
  // Initialize the CommentRepository with the base URL of your backend
  return CommentRepository('http://localhost:3000'); // Update with your actual base URL
});

final commentStateProvider = StateNotifierProvider<CommentNotifier, List<Map<String, dynamic>>>((ref) {
  final repository = ref.watch(commentRepositoryProvider);
  return CommentNotifier(repository);
});