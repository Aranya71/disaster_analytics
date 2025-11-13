import 'package:get/get.dart';
import '../../../data/models/alert_model.dart';

class AlertController extends GetxController {
  var alerts = <AlertModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlerts();
  }

  void fetchAlerts() {
    Future.delayed(const Duration(seconds: 1), () {
      alerts.value = [
        AlertModel(
          id: '1',
          title: 'Heavy Rainfall Alert',
          description: 'Heavy rainfall expected in the next 6 hours',
          severity: 'High',
          timestamp: DateTime.now(),
          location: 'Your Area',
        ),
        AlertModel(
          id: '2',
          title: 'Flood Warning',
          description: 'Possible flooding in low-lying areas',
          severity: 'Medium',
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
          location: 'Nearby Region',
        ),
      ];
      isLoading.value = false;
    });
  }
}