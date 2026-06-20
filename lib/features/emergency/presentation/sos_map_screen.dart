import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class SosMapScreen extends StatelessWidget {
  const SosMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey.shade300,
            child: const Center(child: Text('Carte (Map Mockup)')),
          ),
          Positioned(
            top: 48,
            left: 24,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.pop(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Position actuelle', style: TextStyle(color: Colors.grey)),
                  const Text('Cotonou, Quartier Haie Vive', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.push('/sos/tracking'),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.emergency),
                    child: const Text('Confirmer l\'envoi d\'une ambulance'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
