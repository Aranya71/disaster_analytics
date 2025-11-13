import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => Get.toNamed(Routes.ALERT),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRiskCard(),
            const SizedBox(height: 16),
            _buildWeatherCard(),
            const SizedBox(height: 16),
            _buildQuickActions(),
            const SizedBox(height: 16),
            _buildMapPlaceholder(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.EMERGENCY),
        backgroundColor: Colors.red,
        child: const Icon(Icons.emergency),
      ),
    );
  }

  Widget _buildRiskCard() {
    return Obx(() => Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current Risk Level',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: controller.riskLevel.value == 'High'
                          ? Colors.red
                          : Colors.orange,
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      controller.riskLevel.value,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: controller.riskLevel.value == 'High'
                            ? Colors.red
                            : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildWeatherCard() {
    return Obx(() => Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Weather Update',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.temperature.value,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(controller.weatherCondition.value),
              ],
            ),
          ),
        ));
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                'Chat Agent',
                Icons.chat,
                () => Get.toNamed(Routes.CHAT),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                'Alerts',
                Icons.notifications_active,
                () => Get.toNamed(Routes.ALERT),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                'Report',
                Icons.report,
                () => Get.toNamed(Routes.REPORT),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                'Emergency',
                Icons.phone,
                () => Get.toNamed(Routes.EMERGENCY),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    return Card(
      child: Container(
        height: 200,
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 64, color: Colors.grey),
            SizedBox(height: 8),
            Text('Map View', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}