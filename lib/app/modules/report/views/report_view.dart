import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Incident'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                labelText: 'Incident Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => controller.selectedImage.value != null
                ? Image.file(
                    File(controller.selectedImage.value!.path),
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : const SizedBox()),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: controller.pickImage,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Take Photo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: controller.getLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Get Location'),
            ),
            const SizedBox(height: 8),
            Obx(() => controller.currentLocation.value.isNotEmpty
                ? Text('Location: ${controller.currentLocation.value}')
                : const SizedBox()),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.submitReport,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.blue,
              ),
              child: const Text('Submit Report', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}