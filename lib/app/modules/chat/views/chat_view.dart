import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../../../core/utils/constants.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Agent'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return _buildMessageBubble(message);
                  },
                )),
          ),
          _buildQuickReplies(),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    return Align(
      alignment: message['isBot'] ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message['isBot'] ? Colors.grey[300] : Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message['text'],
          style: TextStyle(
            color: message['isBot'] ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickReplies() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        spacing: 8,
        children: Constants.quickReplies.map((reply) {
          return ActionChip(
            label: Text(reply),
            onPressed: () => controller.sendMessage(reply),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => controller.sendMessage(controller.messageController.text),
            ),
          ),
        ],
      ),
    );
  }
}