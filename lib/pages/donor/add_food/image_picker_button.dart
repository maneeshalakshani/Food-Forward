import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/donor/add_food/food_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_mobx/flutter_mobx.dart';

class ImagePickerWidget extends HookWidget {
  ImagePickerWidget({
    Key? key,
    required this.store,
  }) : super(key: key);
  final FoodStore store;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: const Text("Upload Image")
          ),
          Observer(builder: (BuildContext context){
            return Text(store.uploadedImageLink ?? 'Image Not Selected', style: TextStyle(color: Colors.white),);
          }),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      final storage = firebase_storage.FirebaseStorage.instance;

      // Create a unique filename for the uploaded image (e.g., using a timestamp)
      String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
          imageFile.path.split('/').last;

      final ref = storage.ref().child('images/$fileName');

      try {
        await ref.putFile(imageFile);
        // The image has been uploaded to Firebase Storage.
        final imageLink = await ref.getDownloadURL();
        store.setUploadedImageLink(uploadedImageLink: imageLink);
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }
}
