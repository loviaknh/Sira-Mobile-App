import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

class WaitingRoomScreen extends StatelessWidget {
  const WaitingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(title: const Text('Salle d\'attente'), backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, backgroundColor: AppColors.primary, child: Icon(Icons.person, size: 50, color: Colors.white)),
            const SizedBox(height: 16),
            Text('Dr. Aminata Sylla', style: Theme.of(context).textTheme.titleLarge),
            const Text('Généraliste', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  const CircularProgressIndicator(color: AppColors.primary),
                  const SizedBox(height: 24),
                  const Text('En attente du médecin...', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Temps estimé : 2 minutes', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => context.push('/teleconsultation/video'),
                    child: const Text('Simuler la connexion'),
                  ),
                ],
              ),
            ).animate().slideY().fadeIn(),
          ],
        ),
      ),
    );
  }
}
