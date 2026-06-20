import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            color: Colors.grey.shade900,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.videocam_off, color: Colors.white54, size: 80),
                  SizedBox(height: 16),
                  Text('Dr. Aminata Sylla', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 64,
            right: 24,
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.person, color: Colors.white54, size: 40),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(Icons.mic, Colors.white30, Colors.white, () {}),
                _buildControlButton(Icons.videocam, Colors.white30, Colors.white, () {}),
                _buildControlButton(Icons.call_end, Colors.red, Colors.white, () => context.push('/teleconsultation/summary')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon, Color bgColor, Color iconColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: 32),
      ),
    );
  }
}
