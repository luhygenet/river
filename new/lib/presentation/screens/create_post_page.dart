import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_project/providers/item_provider.dart'; // Adjust the import according to your project structure

class LostFoundForm extends ConsumerStatefulWidget {
  @override
  _LostFoundFormState createState() => _LostFoundFormState();
}

class _LostFoundFormState extends ConsumerState<LostFoundForm> {
  final _descriptionController = TextEditingController();
  File? _image;

  Future<void> _selectImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_image != null && _descriptionController.text.isNotEmpty) {
      final imageBytes = await _image!.readAsBytes();
      final newItem = {
        'description': _descriptionController.text,
        'picture': imageBytes,
      };

      // Add the item using the provider
      final itemNotifier = ref.read(itemStateProvider.notifier);
      await itemNotifier.addItem(newItem);

      // Clear the form
      setState(() {
        _descriptionController.clear();
        _image = null;
      });

      // Navigate back or show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item created successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please provide an image and description')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(179, 3, 168, 244),
              child: Padding(
                padding: EdgeInsets.all(60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      width: 130,
                      height: 130,
                      child: Center(
                        child: _image == null
                            ? Image.asset('Assets/post.png',
                                width: 100, height: 100)
                            : Image.file(_image!, width: 100, height: 100),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _selectImage,
                      child: const Text("Select image"),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      width: 300,
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              child: const Text(
                                "Description",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              controller: _descriptionController,
                              decoration: const InputDecoration(
                                labelText: "Description",
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
