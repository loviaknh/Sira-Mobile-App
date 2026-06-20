import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class EmergencyTrackingScreen extends StatelessWidget {
  const EmergencyTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ambulance en route'), backgroundColor: AppColors.emergency, foregroundColor: Colors.white),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.shade200,
              child: const Center(child: Icon(Icons.map, size: 100, color: Colors.grey)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
            child: Column(
              children: [
                const Text('Arrivée estimée', style: TextStyle(color: Colors.grey)),
                const Text('4 minutes', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.emergency)),
                const SizedBox(height: 24),
                ListTile(
                  leading: const CircleAvatar(backgroundColor: AppColors.backgroundSecondary, child: Icon(Icons.airport_shuttle, color: AppColors.primary)),
                  title: const Text('SAMU Cotonou - Unité 4'),
                  subtitle: const Text('Plaque : AB-123-CD'),
                  trailing: IconButton(icon: const Icon(Icons.phone, color: Colors.green), onPressed: () {}),
                  onTap: () => context.push('/sos/assigned'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
