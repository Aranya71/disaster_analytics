import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  var riskLevel = 'Low'.obs;
  var temperature = '28°C'.obs;
  var weatherCondition = 'Partly Cloudy'.obs;
  var currentLocation = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocation();
    fetchWeatherData();
  }

  Future<void> fetchLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      currentLocation.value = '${position.latitude}, ${position.longitude}';
    } catch (e) {
      currentLocation.value = 'Location unavailable';
    }
  }

  void fetchWeatherData() {
    // Simulated data - replace with actual API call
    riskLevel.value = 'Medium';
    temperature.value = '32°C';
    weatherCondition.value = 'Heavy Rain Expected';
  }
}