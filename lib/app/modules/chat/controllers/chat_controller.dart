import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final messageController = TextEditingController();
  var messages = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    messages.add({
      'text': 'Hello! I\'m your disaster management assistant. How can I help you?',
      'isBot': true,
    });
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    messages.add({'text': text, 'isBot': false});
    messageController.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      _generateBotResponse(text);
    });
  }

  void _generateBotResponse(String userMessage) {
    String response;

    if (userMessage.toLowerCase().contains('what should i do')) {
      response = 'Stay calm. Move to higher ground if flooding is expected. Keep emergency supplies ready.';
    } else if (userMessage.toLowerCase().contains('report')) {
      response = 'You can report incidents from the Report screen. Include photos and location for faster response.';
    } else if (userMessage.toLowerCase().contains('contact')) {
      response = 'You can contact emergency services from the Emergency screen. Police: 100, Fire: 101, Ambulance: 102';
    } else {
      response = 'I can help you with disaster preparedness, emergency contacts, and reporting incidents.';
    }

    messages.add({'text': response, 'isBot': true});
  }
}