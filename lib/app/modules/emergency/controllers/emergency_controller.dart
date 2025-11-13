import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/emergency_contact_model.dart';
import '../../../core/utils/constants.dart';

class EmergencyController extends GetxController {
  final contacts = <EmergencyContact>[
    EmergencyContact(name: 'Police', icon: '🚔', number: Constants.policeNumber),
    EmergencyContact(name: 'Fire', icon: '🚒', number: Constants.fireNumber),
    EmergencyContact(name: 'Ambulance', icon: '🚑', number: Constants.ambulanceNumber),
    EmergencyContact(name: 'Hospital', icon: '🏥', number: Constants.hospitalNumber),
  ];

  Future<void> makeCall(String number) async {
    final uri = Uri.parse('tel:$number');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar('Error', 'Cannot make call');
    }
  }
}