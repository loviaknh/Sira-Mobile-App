import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/sos_provider.dart';

class SosScreen extends ConsumerWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sosState = ref.watch(sosProvider);

    // Écouter les changements d'état pour naviguer ou afficher des erreurs
    ref.listen<SosState>(sosProvider, (previous, next) {
      if (next == SosState.sent) {
        context.push('/sos/tracking');
        ref.read(sosProvider.notifier).reset(); // Reset pour la prochaine fois
      } else if (next == SosState.error) {
        final error = ref.read(sosProvider.notifier).errorMessage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: $error'), backgroundColor: Colors.red),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.emergency,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _showConfirmationDialog(context, ref),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, spreadRadius: 10)],
                ),
                child: Center(
                  child: sosState == SosState.loading
                      ? const CircularProgressIndicator(color: AppColors.emergency)
                      : const Text('SOS', style: TextStyle(color: AppColors.emergency, fontSize: 64, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 48),
            const Text('Appuyez pour appeler\nles urgences (SAMU)', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24)),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 32),
              SizedBox(width: 8),
              Text('Urgence Médicale'),
            ],
          ),
          content: const Text('⚠️ Confirmez-vous le déclenchement de cette urgence ? Une ambulance sera dépêchée sur votre position actuelle.'),
          actions: [
            TextButton(
              child: const Text('Annuler', style: TextStyle(color: Colors.grey)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Déclencher SOS', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(sosProvider.notifier).triggerSos();
              },
            ),
          ],
        );
      },
    );
  }
}
