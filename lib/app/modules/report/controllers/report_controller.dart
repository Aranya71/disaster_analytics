import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class ReportController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var selectedImage = Rx<XFile?>(null);
  var currentLocation = ''.obs;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    selectedImage.value = image;
  }

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      currentLocation.value = '${position.latitude}, ${position.longitude}';
    } catch (e) {
      currentLocation.value = 'Unable to get location';
    }
  }

  void submitReport() {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    Get.snackbar('Success', 'Report submitted successfully');
    titleController.clear();
    descriptionController.clear();
    selectedImage.value = null;
    currentLocation.value = '';
  }
}