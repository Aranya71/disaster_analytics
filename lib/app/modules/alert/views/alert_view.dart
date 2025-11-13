import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/alert_controller.dart';

class AlertView extends GetView<AlertController> {
  const AlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Alerts'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.alerts.length,
          itemBuilder: (context, index) {
            final alert = controller.alerts[index];
            return _buildAlertCard(alert);
          },
        );
      }),
    );
  }

  Widget _buildAlertCard(alert) {
    Color severityColor = alert.severity == 'High'
        ? Colors.red
        : alert.severity == 'Medium'
            ? Colors.orange
            : Colors.yellow;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: severityColor, width: 2),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Icon(Icons.warning, color: severityColor, size: 32),
          title: Text(
            alert.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(alert.description),
              const SizedBox(height: 4),
              Text(
                'Location: ${alert.location}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          trailing: Chip(
            label: Text(
              alert.severity,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: severityColor,
          ),
        ),
      ),
    );
  }
}