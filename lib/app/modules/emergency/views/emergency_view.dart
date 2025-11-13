import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/emergency_controller.dart';
import '../../../data/models/emergency_contact_model.dart';

class EmergencyView extends GetView<EmergencyController> {
  const EmergencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Tap to call emergency services',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: controller.contacts.length,
                itemBuilder: (context, index) {
                  final contact = controller.contacts[index];
                  return _buildEmergencyCard(contact);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyCard(EmergencyContact contact) {
    return Card(
      child: InkWell(
        onTap: () => controller.makeCall(contact.number),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(contact.icon, style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 8),
            Text(
              contact.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(contact.number),
          ],
        ),
      ),
    );
  }
}
