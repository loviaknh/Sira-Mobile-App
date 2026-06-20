import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Suivi de commande'), backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Icon(Icons.check_circle, color: AppColors.primary, size: 80),
            const SizedBox(height: 16),
            const Text('Commande confirmée', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 48),
            _buildStep('Commande reçue', '10:30', true),
            _buildStep('Préparation', '10:45', true),
            _buildStep('En cours de livraison', 'Livreur en route', false),
            _buildStep('Livrée', '--:--', false, isLast: true),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.go('/main'),
              child: const Text('Retour à l\'accueil'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String title, String subtitle, bool isDone, {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? AppColors.primary : Colors.grey.shade300,
              ),
              child: isDone ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isDone ? AppColors.primary : Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isDone ? Colors.black : Colors.grey)),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
