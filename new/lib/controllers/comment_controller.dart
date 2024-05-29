import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project/repositories/comment_repository.dart';

class CommentNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  final CommentRepository _repository;

  CommentNotifier(this._repository) : super([]);

  Future<void> fetchComments() async {
    state = await _repository.getAllComments();
  }

  Future<void> addComment(Map<String, dynamic> commentData) async {
    try {
      final newComment = await _repository.createComment(commentData);
      state = [...state, newComment];
    } catch (e) {
      // Handle error
    }
  }

  Future<void> editComment(String id, Map<String, dynamic> updateData) async {
    try {
      final updatedComment = await _repository.updateComment(id, updateData);
      state = state.map((c) => c['id'] == id ? updatedComment : c).toList();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> deleteComment(String id) async {
    try {
      await _repository.deleteComment(id);
      state = state.where((c) => c['id'] != id).toList();
    } catch (e) {
      // Handle error
    }
  }
}
