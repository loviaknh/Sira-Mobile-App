import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class ConsultationSummaryScreen extends StatelessWidget {
  const ConsultationSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compte-rendu'), automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.check_circle, color: AppColors.primary, size: 80),
            const SizedBox(height: 16),
            const Text('Consultation terminée', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Diagnostic', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Céphalées de tension mineures. Pas de signes de gravité.'),
                  SizedBox(height: 24),
                  Text('Recommandations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Repos, hydratation et paracétamol si douleur.'),
                ],
              ),
            ),
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
}
