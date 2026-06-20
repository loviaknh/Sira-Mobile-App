import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ChatConsultationScreen extends StatelessWidget {
  const ChatConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message au médecin')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                _buildMessage('Bonjour Docteur, j\'ai toujours mal à la tête.', isMe: true),
                _buildMessage('Bonjour Ahouefa, prenez le paracétamol comme prescrit et reposez-vous.', isMe: false),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.attach_file, color: Colors.grey), onPressed: () {}),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Écrire un message...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                      filled: true,
                      fillColor: AppColors.backgroundSecondary,
                    ),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send, color: AppColors.primary), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, {required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primary : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black)),
      ),
    );
  }
}
