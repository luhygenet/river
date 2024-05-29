import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project/repositories/item_repository.dart';

class ItemNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  final ItemRepository _repository;

  ItemNotifier(this._repository) : super([]);

  Future<void> fetchItems() async {
    state = await _repository.getAllItems();
  }

  Future<void> addItem(Map<String, dynamic> itemData) async {
    try {
      final newItem = await _repository.createItem(itemData);
      state = [...state, newItem];
    } catch (e) {
      // Handle error
    }
  }

  Future<void> editItem(String id, Map<String, dynamic> updateData) async {
    try {
      final updatedItem = await _repository.updateItem(id, updateData);
      state = state
          .map((item) => item['id'] == id ? updatedItem : item)
          .toList();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      await _repository.deleteItem(id);
      state = state.where((item) => item['id'] != id).toList();
    } catch (e) {
      // Handle error
    }
  }
}